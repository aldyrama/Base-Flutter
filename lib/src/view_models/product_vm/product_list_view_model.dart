

import 'package:base_project_flutter/src/network/network_service.dart';
import 'package:flutter/material.dart';

import 'product_view_model.dart';


class ProductListViewModel extends ChangeNotifier {

  List<ProductViewModel> product = List<ProductViewModel>();

  Future<void> fetchProduct() async {
    final results =  await NetworkService().productService();
    this.product = results.data.map((value) => ProductViewModel(productsModel: value)).toList();
    print("this movie : ${results}");
    notifyListeners(); 
  }
}