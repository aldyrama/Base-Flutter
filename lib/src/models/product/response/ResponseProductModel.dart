
import 'package:base_project_flutter/src/models/product/ProductsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ResponseProductModel.g.dart';

@JsonSerializable()
class ResponseProductModel {

  final int page;
  final List<ProductsModel> data;

  ResponseProductModel({this.page, this.data});

  @override
  String toString() {
    return 'ResponseProductsModel{page: $page, data: $data}';
  }

  factory ResponseProductModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseProductModelToJson(this);

}