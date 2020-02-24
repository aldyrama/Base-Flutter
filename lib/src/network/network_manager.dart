import 'dart:convert';

import 'package:alice/alice.dart';
import 'package:base_project_flutter/src/network/network_endpoints.dart';
import 'package:base_project_flutter/src/utils/widget/modal/show_ok_modal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

class NetworkManager{
  final bool showCurl = true;
  BuildContext context;
  PublishSubject<bool> logOutSubject;

  NetworkManager(this.context);

  static NetworkManager _apiManager;

  static initAPIManager(BuildContext context){
    _apiManager = NetworkManager(context);
  }

  static Alice alice = Alice(showNotification: true);

  static NetworkManager getAPI() => _apiManager;

  static Future<Dio> getManager({bool showAlert = true}) async {
    return _apiManager._manager(showAlert:showAlert);
  }

  Future<Dio> _manager({bool showAlert = true}) async {
    BaseOptions option = await getDioOptions();
    Dio dio = Dio(option);

    dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options){
          // Do something before request is sent
          String curl = "curl -k -X ${options.method} --dump-header -";

          for (String key in options.headers.keys) {
            String header = " -H \"$key: ${options.headers[key]}\"";
            curl = curl + header;
          }

          dynamic data = options.data;
          try {
            String encoding = json.encode(data);
            if (encoding != null) {
              curl = curl + " -d \"$encoding\"";
            }
          } catch (error) {
            if (showCurl) {
              if(data is String){
                print("Param:" + data);
              }
            }
          }

          if (options.path.contains("http")) {
            curl = curl + " ${options.path}";
          } else {
            curl = curl + " ${options.baseUrl}${options.path}";
          }

          if (showCurl) {
            print(curl);
          }

          return options; //continue
        },
        onResponse:(Response response) {
          // Do something with response data
          return response; // continue
        },
        onError: (DioError e) {
          // Do something with response error
          // Do something with response error
          Response response = e.response;

          if (e.response.data is Map == false) {
            e.error = "Not in JSON Format";
            if (showAlert) {
              showOKModal(context,
                  title: "Error", message: e.message);
            }
          } else if (context != null) {
            if (response.statusCode == 401) {
              e.error = "Access Token Expired";
              showOKModal(context,
                  title: "Error " + response.statusCode.toString(),
                  message: e.message).then((value) {
                logOutSubject?.add(true);
              });
            } else if (response.data != null) {
              String message = response.data["message"];
              e.error = message != null ? message : "";
              if (showAlert) {
                showOKModal(context,
                    title: "Error " + response.statusCode.toString(),
                    message: e.message);
              }
            }
          }
          return e; //continue

        }));

    return dio;

  }

  Future<BaseOptions> getDioOptions() async {
    BaseOptions option = BaseOptions();
    option.baseUrl = BASE_URL();
    //option.connectTimeout = 5000; //5s
    //option.receiveTimeout=3000;
    //option.contentType = ContentType.JSON;
    //option.extra = {"alert":"Test Extra"};

    /*
    Map<String, dynamic> auth = await getProfileDic();
    if (auth != null) {
      option.headers = {"Authorization": auth["token"]};
    }
    */

    return option;
  }

}