import 'package:az_store/common/widgets/cart_counter.dart';
import 'package:az_store/common/widgets/custom_app_bar.dart';
import 'package:az_store/common/widgets/navigation_menu.dart';
import 'package:az_store/common/widgets/product_grid_shimmer.dart';
import 'package:az_store/common/widgets/products_grid.dart';
import 'package:az_store/features/shop/controllers/product/wishlist_controller.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:az_store/utils/constants/image_strings.dart';
import 'package:az_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    final controller = WishlistController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          CartCounter(iconColor: isDark ? KColors.white : KColors.black)
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Obx(
                  ()=> FutureBuilder(
                  future: controller.getFavorites(),
                  builder: (_,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const ProductsGridShimmer();
                    }
                    if(snapshot.hasError){
                      return const Center(child: Text("Something went wrong"),);
                    }
                    if(snapshot.data!.isEmpty){
                      return Center(
                        child: Column(
                          children: [
                            Lottie.asset(KImages.emptyWishlist, width: 0.8.sw),
                            const Text("Whoops, your wishlist is empty...", textAlign: TextAlign.center,),
                            SizedBox(height: 24.h,),
                            SizedBox(width: 200.w, child: OutlinedButton(onPressed: ()=>Get.offAll(()=>NavigationMenu()), style: OutlinedButton.styleFrom(
                                backgroundColor: KColors.black,
                              side: isDark ? const BorderSide(color: KColors.grey) : BorderSide.none
                            ), child: Text("Let's add some",style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: KColors.white
                            ),)))
                          ],
                        ),
                      );
                    }
                    return ProductsGrid(products: snapshot.data!);
                  },
                ),
              )
        ),
      ),
    );
  }
}
