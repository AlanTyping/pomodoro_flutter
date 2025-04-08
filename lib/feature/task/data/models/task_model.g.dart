// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => _TaskModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String,
  date: json['date'] as String,
  completed: (json['completed'] as num).toInt(),
  cycle: json['cycle'] as String,
);

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'completed': instance.completed,
      'cycle': instance.cycle,
    };
