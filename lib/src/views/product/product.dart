
import 'package:base_project_flutter/src/view_models/product_vm/product_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'product_list_page.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductListViewModel(),
      child: ProductListPage(),
    );
  }

}