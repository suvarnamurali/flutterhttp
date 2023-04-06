import 'package:get/get.dart';
import 'package:httpapp/http_repository/api_rep.dart';
import 'package:httpapp/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.productData}) : super(key: key);

  final Products productData;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Center(
                  child: Image.network(
                    widget.productData.image.toString(),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productData.title.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 10,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.productData.rating!.rate.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      widget.productData.category.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.productData.description.toString(),
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.currency_rupee,
                          size: 12,
                        ),
                        Text(
                          widget.productData.price.toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        ApiRepo().updateProducts(
                            widget.productData.title.toString(),
                            widget.productData.id.toString(),
                            widget.productData.price.toString());
                        Get.snackbar(
                            icon: const Icon(Icons.update),
                            'Message',
                            'Product updated sucessfully',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black45);
                      },
                      child: const Text('Update')),
                  TextButton(
                      onPressed: () {
                        Get.snackbar(
                            icon: const Icon(Icons.delete),
                            'Message',
                            'Product Deleted',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black45);
                        setState(() {
                          ApiRepo()
                              .deleteProduct(widget.productData.id.toString());
                        });
                      },
                      child: const Text('Delete')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
