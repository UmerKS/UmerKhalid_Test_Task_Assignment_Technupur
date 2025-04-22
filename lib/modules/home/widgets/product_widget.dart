import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:umer_khalid/modules/home/controllers/home_controller.dart';
import 'package:umer_khalid/res/colors/app_colors.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Obx(() {
            final subCatName = controller.selectedSubCategoryName;
            return Row(
              children: [
                Text(
                  'Products ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  "($subCatName)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            );
          }),
        ),

        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  product.image,
                                  height: 150.h,
                                  width: 150.w,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 5),

                                    Text(
                                      '\$${calculateDiscountedPrice(product.price, product.discountPercentage).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                product.status == false
                                    ? Card(
                                      color: AppColors.yellowlight,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 10.h,
                                        ),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.yellow,
                                          borderRadius: BorderRadius.circular(
                                            50.r,
                                          ),
                                        ),
                                        child: const Text(
                                          'Sold Out',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                    )
                                    : SizedBox(height: 25.h),
                              ],
                            ),
                          ),
                        ),
                        if (product.discountPercentage != null &&
                            product.discountPercentage! > 0)
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '-${product.discountPercentage}%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  double calculateDiscountedPrice(
    double originalPrice,
    double? discountPercentage,
  ) {
    if (discountPercentage == null || discountPercentage <= 0) {
      return originalPrice;
    }

    // Calculate the discounted amount and subtract from original price
    double discountAmount = originalPrice * (discountPercentage / 100);
    return originalPrice - discountAmount;
  }
}
