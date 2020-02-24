
import 'package:json_annotation/json_annotation.dart';

part 'ProductsModel.g.dart';

@JsonSerializable()
class ProductsModel {

  final int id;
  final String name;
  final String image;

  ProductsModel({this.id, this.name, this.image});

  @override
  String toString() {
    return 'MovieModel{id: $id, name: $name, image: $image}';
  }

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

}