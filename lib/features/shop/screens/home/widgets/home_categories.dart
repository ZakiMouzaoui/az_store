import 'package:az_store/features/shop/controllers/shop/category_controller.dart';
import 'package:az_store/features/shop/screens/home/widgets/categories_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/section_header.dart';
import '../../../../../common/widgets/vertical_icon_text.dart';
import '../../../../../utils/constants/colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    //final reviewRepo = Get.put(ReviewRepository());

    return RefreshIndicator(
      onRefresh: ()async{

      },
      child: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            children: [
              const SectionHeader(
                text: "Popular Categories",
                textColor: KColors.white,
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(() {
                if (controller.isCategoriesLoading.value) {
                  return const CategoriesShimmer();
                }
                return SizedBox(
                  height: 95.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.featuredCategories.length,
                    itemBuilder: (_, index) {
                      final category = controller.featuredCategories[index];
                      return VerticalIconText(categoryModel: category);
                    },
                    separatorBuilder: (_, __) => SizedBox(
                      width: 16.w,
                    ),
                  ),
                );
              }),


              /*
              ElevatedButton(onPressed:() async{
                /*
                final db = FirebaseFirestore.instance;
                final snapshots = await db.collection("products").get();
                final batch = db.batch();
                for(var snapshot in snapshots.docs){
                  if(snapshot.id != "1"){
                    batch.update(snapshot.reference, {
                      "totalReviews": 0
                    });
                  }
                }
                await batch.commit();
                print("reviews added");
                 */
                 try{
                   await reviewRepo.addReview(reviews[reviews.length-1], 3.8, 10);
                 }
                 catch(e){
                   print(e.toString());
                 }
              }, child: const Text("update")),
               */
            ],
          )),
    );
  }
}
