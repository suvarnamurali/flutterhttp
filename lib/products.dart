import 'package:get/get.dart';
import 'package:httpapp/http_repository/api_rep.dart';
import 'package:httpapp/models/product_model.dart';
import 'package:httpapp/products/products_card.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  late Future<List<Products>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = ApiRepo().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
        actions: [
          IconButton(
              onPressed: () {
                ApiRepo().createProduct();
                Get.snackbar("message", "Product added sucessfully",
                    snackPosition: SnackPosition.TOP);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder<List<Products>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.8,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  productData: snapshot.data![index],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
