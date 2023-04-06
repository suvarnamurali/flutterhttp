import 'dart:convert';

import 'package:httpapp/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiRepo {
  Future<List<Products>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Products>((json) => Products.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<http.Response> createProduct() async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': 'tshirt',
        'price': '2000',
        'description': 'black cotton',
        'category': 'five sleeve',
        'image': 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        'rating': {"rate": 3.9, "count": 120}
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      throw Exception('Failed to create Product.');
    }
  }

  Future<http.Response> deleteProduct(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://fakestoreapi.com/products/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.request);
    return response;
  }

  Future<http.Response> updateProducts(
      String title, String id, String price) async {
    final http.Response response = await http.put(
      Uri.parse('https://fakestoreapi.com/products/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'title': title, 'price': price}),
    );
    print(response.body);
    return response;
  }
}