import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

class TaskModel extends Task {
  TaskModel({
    super.id,
    required super.title,
    required super.date,
    required super.completed,
    required super.cycle,
  });

  //CONSTRUCTOR TIPO FÁBRICA: Convierte un mapa JSON en una instancia de TaskModel
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        completed: json['completed'],
        cycle: json['cycle']
      );
  }

  //Método para convertir un objeto TaskModel en un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'completed': completed,
      'cycle': cycle
    };
  }
}
