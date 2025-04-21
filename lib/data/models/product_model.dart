class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final double? discountPercentage;
  final bool status;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    this.discountPercentage,
    required this.status,
  });

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'discountPercentage': discountPercentage,
      'status': status,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      discountPercentage: json['discountPercentage'] != null
          ? (json['discountPercentage'] as num).toDouble()
          : null,
      status: json['status'],
    );
  }
}
