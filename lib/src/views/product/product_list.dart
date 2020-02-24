
import 'package:base_project_flutter/src/view_models/product_vm/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {

  final List<ProductViewModel> product;

  ProductList({this.product});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.product.length,
      itemBuilder: (context, index) {
        final product = this.product[index];
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.image)
              ),
              borderRadius: BorderRadius.circular(6)
            ),
            width: 50, 
            height: 100,
            ),
          title: Text(product.name),
        );
      },
    );
  }
}