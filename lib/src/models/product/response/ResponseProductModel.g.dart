// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseProductModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseProductModel _$ResponseProductModelFromJson(Map<String, dynamic> json) {
  return ResponseProductModel(
      page: json['page'] as int,
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : ProductsModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResponseProductModelToJson(
        ResponseProductModel instance) =>
    <String, dynamic>{'page': instance.page, 'data': instance.data};
