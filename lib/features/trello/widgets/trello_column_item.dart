import 'package:flutter/material.dart';
import 'package:lawhack/constant/text_style.dart';
import 'package:lawhack/features/trello/models/trello_task.dart';

class ColumnItem extends StatelessWidget {
  const ColumnItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TrelloTask task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      padding: const EdgeInsets.all(10),
      child: Text(task.name, style: headline1),
    );
  }
}
