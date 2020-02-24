

import 'package:base_project_flutter/src/models/product/ProductsModel.dart';

class ProductViewModel {

  final ProductsModel productsModel;

  ProductViewModel({this.productsModel});

  String get name {
    return this.productsModel.name;
  }

  String get image {
    return this.productsModel.image;
  }

}