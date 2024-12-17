// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cow_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CowData _$CowDataFromJson(Map<String, dynamic> json) => CowData(
      id: (json['id'] as num?)?.toInt(),
      query: json['query'] as String?,
      name: json['name'] as String?,
      sex: (json['sex'] as num?)?.toInt(),
      birth: json['birth'] == null
          ? null
          : DateTime.parse(json['birth'] as String),
    );

Map<String, dynamic> _$CowDataToJson(CowData instance) => <String, dynamic>{
      'id': instance.id,
      'query': instance.query,
      'name': instance.name,
      'sex': instance.sex,
      'birth': instance.birth?.toIso8601String(),
    };
