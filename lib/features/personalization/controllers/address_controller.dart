import 'package:az_store/data/repositories/address/address_respository.dart';
import 'package:az_store/features/personalization/models/address_model.dart';
import 'package:az_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';

class AddressController extends GetxController{
  static AddressController get instance => Get.find();

  final addressRepo = Get.put(AddressRepository());

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController phoneNumberCtr = TextEditingController();
  TextEditingController cityCtr = TextEditingController();
  TextEditingController postalCodeCtr = TextEditingController();
  TextEditingController streetCtr = TextEditingController();

  RxList<AddressModel> addresses = <AddressModel>[].obs;
  Rx<AddressModel> defaultAddress = AddressModel.empty().obs;

  Rx<bool> isLoading = true.obs;
  Rx<bool> isFormLoading  = false.obs;
  Rx<bool> isDefaultChecked = false.obs;

  final checkoutCtr = Get.put(CheckoutController());

  @override
  void onInit() {
    fetchUserAddresses();
    super.onInit();
  }

  void fetchUserAddresses() async{
    try{
      final res = await addressRepo.fetchUserAddresses();

      if(res.isNotEmpty){
        addresses.assignAll(res);
        checkoutCtr.isCheckoutEnabled.value = true;
        defaultAddress.value = addresses.firstWhere((element) => element.isDefaultAddress);
      }

    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }

  void toggleCheckbox(){
    isDefaultChecked.toggle();
  }

  void addAddress() async{
    if(key.currentState!.validate()){
      try{
        isFormLoading.value = true;
        final normalizedPhoneNumber = PhoneNumber(countryISOCode: 'DZ', countryCode: '+213', number: phoneNumberCtr.text).completeNumber;
        final addressModel = AddressModel(
            id: "",
            street: streetCtr.text,
            city: cityCtr.text,
            phoneNumber: normalizedPhoneNumber,
            postalCode: postalCodeCtr.text,
            isDefaultAddress: defaultAddress.value.id != null ? true : false
        );
        final id = await addressRepo.addAddress(addressModel);
        addressModel.id = id;
        addresses.insert(0, addressModel);
        if(defaultAddress.value.id!.isEmpty){
          defaultAddress.value = addressModel;
        }
        phoneNumberCtr.clear();
        cityCtr.clear();
        postalCodeCtr.clear();
        streetCtr.clear();
        Get.back();
      }
      catch(e){
        Fluttertoast.showToast(msg: e.toString());
      }
      finally{
        isFormLoading.value = false;
      }
    }
  }

  void setDefaultAddress(AddressModel addressModel) async{
    try{
      defaultAddress.value = addressModel;
      await addressRepo.setDefaultAddress(addressModel.id);
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
      isLoading.value = false;
    }
  }

  void deleteAddress(String addressId, int index) async{
    try{
      addresses.removeAt(index);
      if(addressId == defaultAddress.value.id){
        if(addresses.isNotEmpty){
          defaultAddress.value =  addresses.first;
        }
      }
      await addressRepo.deleteAddress(addressId);
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void dispose() {
    phoneNumberCtr.dispose();
    cityCtr.dispose();
    postalCodeCtr.dispose();
    streetCtr.dispose();
    super.dispose();
  }
}
