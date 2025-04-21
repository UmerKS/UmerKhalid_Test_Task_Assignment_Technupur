import 'package:get/get.dart';
import 'package:umer_khalid/data/models/category_model.dart';
import 'package:umer_khalid/data/models/subcategory_model.dart';
import 'package:umer_khalid/data/models/product_model.dart';
import 'package:umer_khalid/data/services/api_service.dart';
import 'dart:developer';

class HomeController extends GetxController implements GetxService {
  final ApiService apiService = ApiService();

  RxList<Category> categoriesList = <Category>[].obs;
  RxList<SubCategory> subCategories = <SubCategory>[].obs;
  RxList<Product> products = <Product>[].obs;
  RxInt selectedCategoryId = 1.obs;
  RxInt selectedSubCategoryId = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      categoriesList.value = await apiService.fetchCategories();
      selectedCategoryId.value = categoriesList.first.id;
      setSubCategories();
      setProducts();
    } catch (e) {
      categoriesList.value = [];
      log("Error fetching categories: $e");
    }
  }

  Future<void> setSubCategories() async {
    try {
      Category selectedCategory = categoriesList.firstWhere(
        (Category category) => category.id == selectedCategoryId.value,
      );
      subCategories.value = selectedCategory.subCategories;
      setProducts();
    } catch (e) {
      subCategories.value = [];
      log("Error fetching categories: $e");
    }
  }

  Future<void> setProducts() async {
    try {
      Category selectedCategory = categoriesList.firstWhere(
        (Category category) => category.id == selectedCategoryId.value,
      );
      SubCategory selectedSubCategories = selectedCategory.subCategories
          .firstWhere(
            (SubCategory subCategories) =>
                subCategories.id == selectedSubCategoryId.value,
          );
      products.value = selectedSubCategories.products;
    } catch (e) {
      products.value = [];
      log("Error fetching categories: $e");
    }
  }

  String get selectedSubCategoryName {
    try {
      final selectedCategory = categoriesList.firstWhere(
        (cat) => cat.id == selectedCategoryId.value,
      );
      final selectedSubCategory = selectedCategory.subCategories.firstWhere(
        (sub) => sub.id == selectedSubCategoryId.value,
      );
      return selectedSubCategory.name;
    } catch (e) {
      return '';
    }
  }
  // Add this getter method to HomeController
int getProductQuantity(int productId) {
  try {
    final product = products.firstWhere((product) => product.id == productId);
    return product.quantity;
  } catch (e) {
    log("Error getting product quantity: $e");
    return 0;
  }
}
// Add to HomeController
int getTotalProductsQuantityInSubCategory(int subCategoryId) {
  try {
    final subCategory = subCategories.firstWhere((sub) => sub.id == subCategoryId);
    int total = 0;
    for (var product in subCategory.products) {
      total += product.quantity;
    }
    return total;
  } catch (e) {
    log("Error calculating total quantity: $e");
    return 0;
  }
}
// Add this method to your HomeController
String getSubCategoryQuantity(int subCategoryId) {
  try {
    final subCategory = subCategories.firstWhere((sub) => sub.id == subCategoryId);
    // Sum the quantities of all products in this specific subcategory
    int totalQuantity = 0;
    for (var product in subCategory.products) {
      totalQuantity += product.quantity;
    }
    return totalQuantity.toString();
  } catch (e) {
    log("Error getting subcategory quantity: $e");
    return "0";
  }
}

// Add this method to your HomeController
String getSubCategoryQuantityString(int subCategoryId) {
  try {
    // Find the specific subcategory
    final subCategory = subCategories.firstWhere((sub) => sub.id == subCategoryId);
    
    // If there are products in this subcategory, return the quantity as a string
    if (subCategory.products.isNotEmpty) {
      // Just show the raw quantity value as a string
      return subCategory.products.length.toString();
    }
    return "0";
  } catch (e) {
    log("Error getting subcategory quantity: $e");
    return "0";
  }
}
}
