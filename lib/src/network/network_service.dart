
import 'package:base_project_flutter/src/models/auth/UsersModel.dart';
import 'package:base_project_flutter/src/models/product/response/ResponseProductModel.dart';
import 'package:base_project_flutter/src/network/network_endpoints.dart';
import 'package:base_project_flutter/src/network/network_manager.dart';
import 'package:dio/dio.dart';

class NetworkService{

  Future<UsersModel> loginService() async {
    Dio manager = await NetworkManager.getManager(showAlert: true);
    Response response = await manager.get(NetworkEndpoints().login, );
    Map data = response.data;
    return UsersModel.fromJson(data);
  }

  Future<ResponseProductModel> productService() async {
    Dio manager = await NetworkManager.getManager(showAlert: true);
    Response response = await manager.get(NetworkEndpoints().product);
    final data = response.data;
    return ResponseProductModel.fromJson(data);
  }
}