import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:umer_khalid/modules/home/controllers/home_controller.dart';
import 'package:umer_khalid/modules/home/widgets/app_bar.dart';
import 'package:umer_khalid/modules/home/widgets/category_widget.dart';
import 'package:umer_khalid/modules/home/widgets/product_widget.dart';
import 'package:umer_khalid/modules/home/widgets/subcategory_widget.dart';
import 'package:umer_khalid/res/strings/images.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Column(
        children: [
          // Category Section
          Obx(() {
            if (controller.categoriesList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return CategoryWidget();
          }),
          // SubCategory Section
          Obx(() {
            if (controller.subCategories.isEmpty) {
              return const Center(child: Text("No subcategories available"));
            }
            return SubCategoryWidget();
          }),

          // Product Section
          Obx(() {
            if (controller.subCategories.isEmpty &&
                controller.products.isEmpty) {
              return const Center(child: Text("No products available"));
            }
            return ProductWidget();
          }),
          Obx(() {
            if (controller.categoriesList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.teal[400],
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        AppAssets.deliveryIcon,
                        height: 46.h,
                        width: 46.w,
                      ),
                    ),
                    SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Free Shipping Over \$0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Free returns and exchange',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        AppAssets.phoneIcon,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
