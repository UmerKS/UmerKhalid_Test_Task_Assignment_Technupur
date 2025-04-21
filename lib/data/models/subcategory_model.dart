
import 'package:umer_khalid/data/models/product_model.dart';
class SubCategory {
  final int id;
  final String name;
  final String image;
  final List<Product> products;

  SubCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }


  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      products: (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }
}
