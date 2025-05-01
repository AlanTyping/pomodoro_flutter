// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => _TaskModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String,
  date: json['date'] as String,
  secondsFirstCycle: (json['secondsFirstCycle'] as num).toInt(),
  secondsSecondCycle: (json['secondsSecondCycle'] as num).toInt(),
  secondsThirdCycle: (json['secondsThirdCycle'] as num).toInt(),
  secondsFourthCycle: (json['secondsFourthCycle'] as num).toInt(),
);

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'secondsFirstCycle': instance.secondsFirstCycle,
      'secondsSecondCycle': instance.secondsSecondCycle,
      'secondsThirdCycle': instance.secondsThirdCycle,
      'secondsFourthCycle': instance.secondsFourthCycle,
    };
