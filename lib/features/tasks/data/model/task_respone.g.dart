// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskRespone _$TaskResponeFromJson(Map<String, dynamic> json) => TaskRespone(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TaskResponeToJson(TaskRespone instance) =>
    <String, dynamic>{'data': instance.data};
