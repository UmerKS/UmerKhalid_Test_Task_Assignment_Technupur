import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umer_khalid/modules/home/controllers/home_controller.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    if (controller.selectedCategoryId.value == 0 &&
        controller.categoriesList.isNotEmpty) {
      controller.selectedCategoryId.value = controller.categoriesList.first.id;
   
    }

    return Obx(
      () => SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoriesList.length,
          itemBuilder: (context, index) {
            final category = controller.categoriesList[index];
            final bool isSelected =
                category.id == controller.selectedCategoryId.value;

            final int productCount = category.subCategories.fold(
              0,
              (sum, sub) => sum + (sub.products.length),
            );

            return GestureDetector(
              onTap: () {
                controller.selectedCategoryId.value = category.id;
                controller.setSubCategories();
                log("selected: ${category.name}");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 6,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.red : Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: isSelected ? Colors.white : Colors.grey.shade100,
                      ),
                      child: Text(
                        category.name,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color:
                              isSelected ? Colors.black : Colors.grey.shade600,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -6,
                      right: -6,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color:
                                isSelected ? Colors.red : Colors.grey.shade300,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          category.id == 1
                              ? controller.categoriesList.length.toString()
                              : productCount.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                                isSelected ? Colors.red : Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
