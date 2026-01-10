import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_flutter/feature/task/data/mappers/task_mapper.dart';
import 'package:pomodoro_flutter/feature/task/data/models/task_model.dart';
import 'package:pomodoro_flutter/feature/task/domain/entities/task_entities.dart';

import '../../domain/task_mock.dart';

void main() {
  group('TaskMapper', () {
    // ---------------------------------------------------------------------
    // fromTask
    // ---------------------------------------------------------------------
    test(
      'fromTask recibe Task y retorna TaskModel con todos los campos mapeados',
      () {
        final mapper = TaskMapper();
        final model = mapper.fromTask(mockTask);

        expect(model.id, mockTask.id);
        expect(model.title, mockTask.title);
        expect(model.date, mockTask.date.toIso8601String());

        final cycles = mockTask.cyclesData.values.toList();

        expect(model.secondsFirstCycle, cycles[0]);
        expect(model.secondsSecondCycle, cycles[1]);
        expect(model.secondsThirdCycle, cycles[2]);
        expect(model.secondsFourthCycle, cycles[3]);
      },
    );

    // ---------------------------------------------------------------------
    // fromModel
    // ---------------------------------------------------------------------
    test('fromModel recibe TaskModel y retorna Task con todos los campos', () {
      final model = TaskModel(
        id: 10,
        title: 'asd',
        date: '2024-01-01T00:00:00.000',
        secondsFirstCycle: 1,
        secondsSecondCycle: 2,
        secondsThirdCycle: 3,
        secondsFourthCycle: 4,
      );

      final task = TaskMapper().fromModel(model);

      expect(task.id, 10);
      expect(task.title, 'asd');
      expect(task.date, DateTime.parse(model.date));

      expect(task.cyclesData[Cycle.first], 1);
      expect(task.cyclesData[Cycle.second], 2);
      expect(task.cyclesData[Cycle.third], 3);
      expect(task.cyclesData[Cycle.fourth], 4);

      // Caso completed
      expect(task.completed, false);
    });

    test(
      'fromModel marca completed=true cuando todos los ciclos están completos',
      () {
        final total = TaskMapper().totalDuration;

        final model = TaskModel(
          id: 9,
          title: 'full',
          date: '2024-01-01T00:00:00.000',
          secondsFirstCycle: total,
          secondsSecondCycle: total,
          secondsThirdCycle: total,
          secondsFourthCycle: total,
        );

        final task = TaskMapper().fromModel(model);

        expect(task.completed, true);
      },
    );

    // ---------------------------------------------------------------------
    // fromListModel
    // ---------------------------------------------------------------------
    test('fromListModel convierte correctamente una lista completa', () {
      final listModel = [
        const TaskModel(
          id: 1,
          title: 'asd',
          date: '2024-01-01',
          secondsFirstCycle: 1,
          secondsSecondCycle: 2,
          secondsThirdCycle: 3,
          secondsFourthCycle: 4,
        ),
        const TaskModel(
          id: 2,
          title: 'asd2',
          date: '2024-01-02',
          secondsFirstCycle: 10,
          secondsSecondCycle: 20,
          secondsThirdCycle: 30,
          secondsFourthCycle: 40,
        ),
      ];

      final taskList = TaskMapper().fromListModel(listModel);

      expect(taskList.length, 2);

      // Tipos
      expect(taskList[0], isA<TaskEntity>());
      expect(taskList[1], isA<TaskEntity>());

      // Item 1
      expect(taskList[0].id, 1);
      expect(taskList[0].title, 'asd');
      expect(taskList[0].date, DateTime.parse('2024-01-01'));
      expect(taskList[0].cyclesData[Cycle.first], 1);
      expect(taskList[0].cyclesData[Cycle.second], 2);
      expect(taskList[0].cyclesData[Cycle.third], 3);
      expect(taskList[0].cyclesData[Cycle.fourth], 4);

      // Item 2
      expect(taskList[1].id, 2);
      expect(taskList[1].title, 'asd2');
      expect(taskList[1].date, DateTime.parse('2024-01-02'));
      expect(taskList[1].cyclesData[Cycle.first], 10);
      expect(taskList[1].cyclesData[Cycle.second], 20);
      expect(taskList[1].cyclesData[Cycle.third], 30);
      expect(taskList[1].cyclesData[Cycle.fourth], 40);
    });

    // ---------------------------------------------------------------------
    // fromJsonList
    // ---------------------------------------------------------------------
    test(
      'fromJsonList convierte correctamente List<Map> a List<TaskModel>',
      () {
        final jsonList = [
          {
            "id": 1,
            "title": "taskA",
            "date": "2024-01-05",
            "secondsFirstCycle": 1,
            "secondsSecondCycle": 2,
            "secondsThirdCycle": 3,
            "secondsFourthCycle": 4,
          },
          {
            "id": 50,
            "title": "taskB",
            "date": "2024-01-06",
            "secondsFirstCycle": 10,
            "secondsSecondCycle": 20,
            "secondsThirdCycle": 30,
            "secondsFourthCycle": 40,
          },
        ];

        final models = TaskMapper().fromJsonList(jsonList);

        expect(models.length, 2);

        expect(models[0], isA<TaskModel>());
        expect(models[0].title, 'taskA');
        expect(models[0].id, 1);

        expect(models[1].title, 'taskB');
        expect(models[1].id, 50);
      },
    );

    // ---------------------------------------------------------------------
    // fromListTask
    // ---------------------------------------------------------------------
    test(
      'fromListTask convierte List<Task> a List<TaskModel> con todos los campos',
      () {
        final tasks = [
          TaskEntity(
            id: 1,
            title: 'T1',
            date: DateTime(2024, 1, 1),
            completed: false,
            cyclesData: {
              Cycle.first: 5,
              Cycle.second: 10,
              Cycle.third: 15,
              Cycle.fourth: 20,
            },
          ),
          TaskEntity(
            id: 2,
            title: 'T2',
            date: DateTime(2024, 1, 2),
            completed: true,
            cyclesData: {
              Cycle.first: 1,
              Cycle.second: 2,
              Cycle.third: 3,
              Cycle.fourth: 4,
            },
          ),
        ];

        final models = TaskMapper().fromListTask(tasks);

        expect(models.length, 2);
        expect(models[0], isA<TaskModel>());

        // Item 1
        expect(models[0].id, 1);
        expect(models[0].title, 'T1');
        expect(models[0].date, '2024-01-01T00:00:00.000');
        expect(models[0].secondsFirstCycle, 5);
        expect(models[0].secondsSecondCycle, 10);
        expect(models[0].secondsThirdCycle, 15);
        expect(models[0].secondsFourthCycle, 20);

        // Item 2
        expect(models[1].id, 2);
        expect(models[1].title, 'T2');
        expect(models[1].secondsFirstCycle, 1);
        expect(models[1].secondsSecondCycle, 2);
        expect(models[1].secondsThirdCycle, 3);
        expect(models[1].secondsFourthCycle, 4);
      },
    );
  });
}
