import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umer_khalid/modules/home/controllers/home_controller.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(
      () => SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.subCategories.length,
          itemBuilder: (context, index) {
            final subCategory = controller.subCategories[index];
            final bool isSelected =
                subCategory.id == controller.selectedSubCategoryId.value;

            return GestureDetector(
              onTap: () {
                log("Subcategory clicked: ${subCategory.name}");
                controller.selectedSubCategoryId.value = subCategory.id;
                controller.setSubCategories();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  isSelected
                                      ? Colors.red
                                      : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(subCategory.image),
                          ),
                        ),
                        if (subCategory.products.isNotEmpty)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? Colors.red
                                        : Colors.grey.shade300,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${subCategory.products.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subCategory.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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
