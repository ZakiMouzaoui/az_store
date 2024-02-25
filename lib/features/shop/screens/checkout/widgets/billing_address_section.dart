import 'package:az_store/common/widgets/section_header.dart';
import 'package:az_store/common/widgets/shimmer_loader.dart';
import 'package:az_store/features/personalization/screens/address/user_addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../personalization/controllers/address_controller.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          text: "Shipping Address",
          btnText: "Change",
          onPressed: ()=>Get.to(()=>const UserAddresses()),
        ),
        Obx(() {
          if (addressController.isLoading.isTrue) {
            return Column(
              children: [
                Row(
                  children: [
                    ShimmerLoader(
                      height: 18.h,
                      width: 18.w,
                      radius: 20,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    ShimmerLoader(height: 10.h, width: 220.w)
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    ShimmerLoader(
                      height: 18.h,
                      width: 18.w,
                      radius: 20,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    ShimmerLoader(height: 10.h, width: 260.w)
                  ],
                )
              ],
            );
          }

          if(addressController.addresses.isNotEmpty){
            final defaultAddress = addressController.defaultAddress.value;
            return Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Iconsax.call,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      defaultAddress.phoneNumber,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    const Icon(
                      Iconsax.location,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Flexible(
                        child: Text(
                          defaultAddress.toString(),
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                  ],
                )
              ],
            );
          }
          return const Text("You have no address yet");
        })
      ],
    );
  }
}
