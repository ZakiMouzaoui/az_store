import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/data/repositories/coupon/coupon_repository.dart';
import 'package:az_store/data/repositories/order/order_repository.dart';
import 'package:az_store/features/personalization/controllers/address_controller.dart';
import 'package:az_store/features/personalization/controllers/user_controller.dart';
import 'package:az_store/features/shop/models/order_model.dart';
import 'package:az_store/features/shop/screens/order/my_orders.dart';
import 'package:az_store/utils/constants/image_strings.dart';
import 'package:az_store/utils/formatters/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../personalization/screens/cart/cart_controller.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final List<PaymentMethodModel> paymentMethods = [
    const PaymentMethodModel(name: "Paypal", image: KImages.paypal),
    const PaymentMethodModel(name: "Visa", image: KImages.visa),
    const PaymentMethodModel(name: "Master Card", image: KImages.masterCard),
    const PaymentMethodModel(name: "Google Pay", image: KImages.googlePay),
    const PaymentMethodModel(name: "Apple Pay", image: KImages.applePay),
  ];

  final cartController = CartController.instance;
  final orderRepo = Get.put(OrderRepository());

  final double shippingFee = 10;
  final Rx<bool> isCheckoutEnabled = false.obs;
  final Rx<double> discountPrice = 0.0.obs;

  late Rx<PaymentMethodModel> selectedPaymentMethod = paymentMethods[0].obs;
  Rx<String> couponCode = ''.obs;
  TextEditingController couponCtr = TextEditingController();
  Rx<bool> couponLoading = false.obs;
  Rx<bool> isOrderLoading = false.obs;

  final couponRepo = Get.put(CouponRepository());

  void selectPaymentMethod(PaymentMethodModel paymentMethod) {
    selectedPaymentMethod.value = paymentMethod;
  }

  void onCouponChanged(String value) {
    couponCode.value = value;
  }

  void applyCoupon() async {
    try {
      couponLoading.value = true;
      final coupon = await couponRepo.getCouponByCode(couponCode.value);
      if (coupon == null) {
        Fluttertoast.showToast(
            msg: 'Invalid coupon code or coupon has expired');
        return;
      }
      if (coupon.maxUsageCount == coupon.currentUsageCount) {
        Fluttertoast.showToast(msg: 'Usage count exceeded on this coupon');
        return;
      }
      if (coupon.usedBy!.contains(AuthRepository.instance.authUser!.uid)) {
        Fluttertoast.showToast(
            msg: 'You have reached the usage limit for this coupon code');
        return;
      }
      if (coupon.minPrice >= cartController.totalCartPrice.value) {
        Fluttertoast.showToast(
            msg:
                'Insufficient subtotal to use this coupon. Minimum price is \$${KFormatter.formatPrice(coupon.minPrice)}');
        return;
      }
      discountPrice.value = cartController.totalCartPrice.value * coupon.percentage / 100;
      Fluttertoast.showToast(msg: 'Coupon code applied successfully!');
      couponCtr.clear();
      return;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      couponLoading.value = false;
    }
  }

  void confirmPayment() async {
    try {
      final addressController = AddressController.instance;
      /// Bloody stripe code did not work unfortunately
      /*
      await dotenv.load(fileName: ".env");
      final String stripeSecretKey = dotenv.env["STRIPE_SECRET_KEY"]!;
      final response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: {
            "amount": KFormatter.formatPrice((cartController.totalCartPrice.value +
                shippingFee -
                discountPrice.value)*100),
            "currency": "usd"
          });
      final clientSecret = jsonDecode(response.body)["client_secret"];
      await initializePayment(clientSecret);
      await Stripe.instance.presentPaymentSheet(
        options: const PaymentSheetPresentOptions(
          timeout: 1500
        )
      );
       */

      isOrderLoading.value = true;
      final defaultAddress = addressController.defaultAddress.value;
      DateTime now = DateTime.now();
      int randomDigits = now.microsecondsSinceEpoch % 1000;

      final order = OrderModel(
          trackingCode: "AZ-${defaultAddress.postalCode.substring(0,2)}$randomDigits",
          items: cartController.cartItems,
          totalAmount: cartController.totalCartPrice.value+ shippingFee-discountPrice.value,
          userId: UserController.instance.userModel.value.id,
          deliveryDate: now.add(const Duration(days: 3)),
          shippingAddress: defaultAddress.toJson(),
          couponCode: couponCode.value.isNotEmpty ? couponCode.value : null,
          discountAmount: discountPrice.value != 0 ? discountPrice.value : null
      );

      await OrderRepository.instance.placeOrder(order);
      Get.off(()=>const MyOrders());
      cartController.clearCart();

    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    finally{
      isOrderLoading.value = false;
    }
  }

  Future<void> initializePayment(String clientSecret) async{
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: "Zaki",
        customerId: null,
        customFlow: true,
        setupIntentClientSecret: clientSecret,
        allowsDelayedPaymentMethods: true,
    ));
  }

  @override
  void dispose() {
    couponCtr.dispose();
    super.dispose();
  }
}
