import 'package:json_annotation/json_annotation.dart';

part 'cow_data.g.dart';

@JsonSerializable()
class CowData {
  CowData({
    this.id,
    this.query,
    this.name,
    this.sex,
    this.birth
  });

  factory CowData.fromJson(Map<String, dynamic> json) =>
    _$CowDataFromJson(json);

  int? id;
  String? query;
  String? name;
  int? sex;
  DateTime? birth;

  Map<String, dynamic> toJson() => _$CowDataToJson(this);
}