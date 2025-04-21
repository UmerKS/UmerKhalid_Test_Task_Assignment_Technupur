import 'package:umer_khalid/data/models/subcategory_model.dart';

class Category {
  final int id;
  final String name;
  final List<SubCategory> subCategories;

  Category({
    required this.id,
    required this.name,
    required this.subCategories,
  });

  // Convert Category to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subCategory': subCategories.map((sub) => sub.toJson()).toList(),
    };
  }

  // Create Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      subCategories: (json['subCategory'] as List)
          .map((item) => SubCategory.fromJson(item))
          .toList(),
    );
  }
}
