import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:lawhack/features/trello/models/trello_task.dart';

class TrelloTaskModel extends ChangeNotifier {
  final List<TrelloTask> _tasks = [
    TrelloTask(name: '1 task added', date: DateTime.now(), members: ['1', '2'], location: 'String'),
    TrelloTask(
        name: '2  task added',
        date: DateTime.now(),
        members: ['1', '2'],
        location: 'String',
        status: TaskStatus.inProcess),
    TrelloTask(
        name: '3  task added',
        date: DateTime.now(),
        members: ['1', '2'],
        location: 'String',
        status: TaskStatus.done),
    TrelloTask(
        name: '4  task added', date: DateTime.now(), members: ['1', '2'], location: 'String'),
  ];

  UnmodifiableListView<TrelloTask> get tasks {
    return UnmodifiableListView(_tasks);
  }

  List<TrelloTask> getPlanningTasks() {
    List<TrelloTask> planningTasks = [];
    for (var i in _tasks) {
      if (i.status == TaskStatus.planning) {
        planningTasks.add(i);
      }
    }
    return planningTasks;
  }

  List<TrelloTask> getInProcessTasks() {
    List<TrelloTask> inProcessTasks = [];
    for (var i in _tasks) {
      if (i.status == TaskStatus.inProcess) {
        inProcessTasks.add(i);
      }
    }
    return inProcessTasks;
  }

  List<TrelloTask> getDoneTasks() {
    List<TrelloTask> doneTasks = [];
    for (var i in _tasks) {
      if (i.status == TaskStatus.done) {
        doneTasks.add(i);
      }
    }
    return doneTasks;
  }

  void addTask(
    String newName,
    DateTime newDate,
    List<String> newMembers,
    String newLocation,
  ) {
    final task = TrelloTask(
      name: newName,
      date: newDate,
      members: newMembers,
      location: newLocation,
    );
    _tasks.add(task);
    notifyListeners();
  }

  void updateStatus() {}
}
