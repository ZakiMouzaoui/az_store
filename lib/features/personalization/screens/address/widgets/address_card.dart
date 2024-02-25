import 'package:az_store/features/personalization/controllers/address_controller.dart';
import 'package:az_store/features/personalization/models/address_model.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';


class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.addressModel, required this.isDefaultAddress});

  final AddressModel addressModel;
  final bool isDefaultAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return InkWell(
      onTap: ()=>isDefaultAddress ? null : controller.setDefaultAddress(addressModel),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: isDefaultAddress ? null : Border.all(color: isDark ? KColors.darkerGrey : KColors.grey),
          color: isDefaultAddress ? KColors.primary.withOpacity(0.7) : null
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Stack(
          alignment: Alignment.topRight
          ,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.call, size: 18,),
                    SizedBox(width: 4.w,),
                    Text(addressModel.phoneNumber),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(

                  children: [
                    const Icon(Iconsax.location, size: 18,),
                    SizedBox(width: 4.w,),
                    Flexible(child: Text(addressModel.toString())),
                  ],
                )
              ]
            ),
            isDefaultAddress ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? KColors.white : KColors.black,
              ),
              padding: const EdgeInsets.all(4),
              width: 20.w,
              height: 20.h,
              alignment: Alignment.center,
              child: FittedBox(child: Icon(Icons.check, color: isDark ? KColors.black : KColors.white,)),
            ) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
