import 'package:az_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:az_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../features/shop/models/review_model.dart';

class KHelperFunctions {
  static Color? getColor(String? value) {
    if (value != null) {
      if (value.startsWith('#') && (value.length == 7 || value.length == 4)) {
        try {
          return Color(int.parse(value.substring(1), radix: 16) | 0xFF000000);
        } catch (e) {
          return null;
          //TODO
        }
      } else {
        switch (value.toLowerCase()) {
          case 'green':
            return Colors.green;
          case 'red':
            return Colors.red;
          case 'blue':
            return Colors.blue;
          case 'pink':
            return Colors.pink;
          case 'grey':
            return Colors.grey;
          case 'purple':
            return Colors.purple;
          case 'black':
            return Colors.black;
          case 'white':
            return Colors.white;
          case 'yellow':
            return Colors.yellow;
          case 'orange':
            return Colors.deepOrange;
          case 'brown':
            return Colors.brown;
          case 'teal':
            return Colors.teal;
          case 'indigo':
            return Colors.indigo;
          default:
            return null;
        }
      }
    }
    return null;
  }

  static String hexToColorName(String hexColor) {
    String normalizedHex =
        hexColor.startsWith("#") ? hexColor.substring(1) : hexColor;
    if (normalizedHex.length == 6) {
      normalizedHex = "FF$normalizedHex"; // Add alpha value if missing
    }

    Color color = Color(int.parse("0x$normalizedHex"));

    if (color is MaterialColor) {
      return color[900]!.toString();
    } else {
      return "Unknown";
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static void showPaymentMethods(BuildContext context) {
    final controller = CheckoutController.instance;

    showModalBottomSheet(
        context: context,
        builder: (_) => Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: controller.paymentMethods
                        .map((e) {
                          return ListTile(
                            onTap: (){
                              controller.selectPaymentMethod(e);
                              Get.back();
                            },
                            leading: SizedBox(
                              width: 50.w,
                              height: 50.h,
                              child: Image.asset(e.image, fit: BoxFit.contain, color: e.name == "Apple Pay" ? KColors.white : null,),
                          ),
                      title: Text(e.name, style: Theme.of(context).textTheme.titleLarge,),
                      );
                    })
                        .toList(),
                  ),
                )
              ],
            ));
  }

  static double calculateAverageRating(int rating, List<ReviewModel> reviews) {
    int count = 0;

    for (var review in reviews) {
      if (review.rating == rating) {
        count++;
      }
    }

    return count/reviews.length;
  }
}
