import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/personalization/controllers/address_controller.dart';
import 'package:az_store/features/personalization/screens/address/add_address.dart';
import 'package:az_store/features/personalization/screens/address/widgets/address_card.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class UserAddresses extends StatelessWidget {
  const UserAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: CustomAppBar(
        title:
            Text("Addresses", style: Theme.of(context).textTheme.headlineSmall),
        showReturnBtn: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Obx(() {
            if (controller.isLoading.isTrue) {
              return Center(
                child: KCircularIndicator(
                  size: 30.h,
                ),
              );
            }
            final addresses = controller.addresses;
            if (addresses.isEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(KImages.emptyWishlist, width: 0.8.sw),
                    const Text(
                      "You don't have any address",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            }
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final address = addresses[index];
                  return Obx(
                    () => Dismissible(
                      key: Key(address.id!),
                      background: const Align(alignment: Alignment.centerRight, child: Icon(Iconsax.trash, color: KColors.error,)),
                      confirmDismiss: (_) async{
                        controller.deleteAddress(address.id!, index);
                        return null;
                      },
                      onDismissed: (_){

                      },
                      child: AddressCard(
                        addressModel: address,
                        isDefaultAddress:
                            controller.defaultAddress.value.id == address.id,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(
                      height: 16.h,
                    ),
                itemCount: addresses.length);
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddAddress()),
        backgroundColor: KColors.primary,
        child: const Icon(
          Iconsax.add,
          color: KColors.white,
        ),
      ),
    );
  }
}

/*
FutureBuilder(
              future: controller.fetchUserAddresses(),
              builder: (_, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: KCircularIndicator(
                      size: 30,
                    ),
                  );
                }
                if(snapshot.hasError){
                  return const Text("Something went wrong");
                }
                final addresses = snapshot.data!;
                if(addresses.isEmpty){
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(KImages.emptyWishlist, width: 0.8.sw),
                        const Text("You don't have any address", textAlign: TextAlign.center,)
                      ],
                    ),
                  );
                }
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (_, index) => AddressCard(isSelected: index == 0, addressModel: addresses[index],),
                    separatorBuilder: (_, __) => SizedBox(
                      height: 16.h,
                    ),
                    itemCount: addresses.length);
              },
            ),
 */
