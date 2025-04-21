
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:umer_khalid/data/models/category_model.dart';

class ApiService {
  static const String apiUrl = 'https://tp-flutter-test.vercel.app/v1/category';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(apiUrl));
    print("response => 1");
    if (response.statusCode == 200) {
      print("response => 2");
      final List<dynamic> data = json.decode(response.body);
      print("response => 3 => $data");
      List<Category> tempCategoryList = [];
      for(dynamic categoryJson in data){
        tempCategoryList.add(Category.fromJson(categoryJson));
      }
      return tempCategoryList;
    } else {
      // Show Toast Error
      return [];
    }
  }


}
