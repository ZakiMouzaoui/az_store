import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/k_circular_indicator.dart';
import 'package:az_store/features/personalization/controllers/address_controller.dart';
import 'package:az_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Add new address", style: Theme.of(context).textTheme.headlineSmall,),
        showReturnBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Form(
            key: controller.key,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Iconsax.call)
                  ),
                  controller: controller.phoneNumberCtr,
                  validator: (value) => KValidator.validateEmptyField(value, "Phone number"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "City",
                          prefixIcon: Icon(Iconsax.building)
                      ),
                      controller: controller.cityCtr,
                      validator: (value) => KValidator.validateEmptyField(value, "City"),
                    )),
                    SizedBox(width: 16.h,),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Postal Code",
                          prefixIcon: Icon(Iconsax.code)
                      ),
                      controller: controller.postalCodeCtr,
                      validator: (value) => KValidator.validateEmptyField(value, "Postal code"),
                    ))
                  ],
                ),
                SizedBox(height: 16.h,),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Street",
                      prefixIcon: Icon(Iconsax.location)
                  ),
                  controller: controller.streetCtr,
                  validator: (value) => KValidator.validateEmptyField(value, "Street"),
                ),
                SizedBox(height: 16.h,),
                /*
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 16.h,
                      child: Obx(
                          () => Checkbox(value: controller.isDefaultChecked.value, onChanged: (_){
                            controller.toggleCheckbox();
                        }),
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    const Text("Set as default address")
                  ],
                ),
                 */
                SizedBox(width: double.infinity, child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.addAddress,
                    child: controller.isFormLoading.isTrue ? const KCircularIndicator() : const Text("Add"),
                  ),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
