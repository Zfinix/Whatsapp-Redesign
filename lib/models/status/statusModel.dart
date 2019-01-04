import 'package:json_annotation/json_annotation.dart';

part 'statusModel.g.dart';

@JsonSerializable()
class StatusModel {
  final String msg;
  final String time;
  final String image;

  StatusModel({this.msg, this.image, this.time});

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
