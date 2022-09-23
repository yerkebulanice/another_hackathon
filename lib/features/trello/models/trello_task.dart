import 'package:uuid/uuid.dart';

enum TaskStatus {
  planning,
  inProcess,
  done,
}

class TrelloTask {
  final String id;
  final String name;
  final DateTime date;
  final List<String> members;
  final String location;
  TaskStatus status;

  TrelloTask({
    String? id,
    required this.name,
    required this.date,
    required this.members,
    required this.location,
    this.status = TaskStatus.planning,
  })  : assert(id == null || id.isNotEmpty),
        id = id ?? const Uuid().v4();
}
