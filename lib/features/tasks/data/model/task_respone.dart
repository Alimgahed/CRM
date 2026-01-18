import 'package:json_annotation/json_annotation.dart';
import 'task_model.dart';

part 'task_respone.g.dart';

@JsonSerializable()
class TaskRespone {
  final List<TaskModel>? data;

  TaskRespone({this.data});

  factory TaskRespone.fromJson(Map<String, dynamic> json) =>
      _$TaskResponeFromJson(json);

  Map<String, dynamic> toJson() => _$TaskResponeToJson(this);
}
