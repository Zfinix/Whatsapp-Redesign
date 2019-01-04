// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statusModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) {
  return StatusModel(
      msg: json['msg'] as String,
      image: json['image'] as String,
      time: json['time'] as String);
}

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'time': instance.time,
      'image': instance.image
    };
