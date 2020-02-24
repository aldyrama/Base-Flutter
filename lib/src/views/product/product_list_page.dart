
import 'package:after_layout/after_layout.dart';
import 'package:base_project_flutter/src/utils/widget/modal/progress_bar_modal.dart';
import 'package:base_project_flutter/src/view_models/product_vm/product_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_list.dart';

class ProductListPage extends StatefulWidget {
  @override 
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> with AfterLayoutMixin<ProductListPage>{
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  void showLoading() => isLoading = true;
  void hideLoading() => isLoading = false;

  @override
  ///this function is run first
  void initState() {
    showLoading();
    getData();
    super.initState();
  }

  @override
  ///This function is executed in the end or as a destroyer, for example when leaving a page you can destroy the function, inside the dispose function
  void dispose() {
    super.dispose();
  }

  @override
    void afterFirstLayout(BuildContext context) {
  //    getData();
  }
  
  void getData(){
    ///use the initstate function if you want to retrieve data before displaying it.
    ///Or if you want the process of building a completed view, then retrieve data and display it you can use the afterFirstLayout function
    Provider.of<ProductListViewModel>(context, listen: false).fetchProduct().whenComplete(hideLoading);
  }
  @override
  ///this function is run first to build the display
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product")
      ),
      body: ProgressBarModal(
          opacity: 1.0,
          color: Colors.white,
          inAsyncCall: isLoading,
          child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      if(value.isNotEmpty) {
                        _controller.clear();
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none
                    ),

                  ),
                ),
                Expanded(
                    child: ProductList(product: vm.product))
              ])
          )
      )
    );
  }
}