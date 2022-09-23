import 'package:flutter/material.dart';
import 'package:lawhack/constant/text_style.dart';
import 'package:lawhack/features/trello/models/trello_task.dart';
import 'package:lawhack/features/trello/models/trello_task_model.dart';
import 'package:lawhack/features/trello/widgets/trello_column_item.dart';
import 'package:provider/provider.dart';

class TrelloScreen extends StatefulWidget {
  const TrelloScreen({super.key});

  @override
  State<TrelloScreen> createState() => _TrelloScreenState();
}

class _TrelloScreenState extends State<TrelloScreen> {
  // final GlobalKey _draggableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text('Dashboard(Запланированные заседания)', style: headline1),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  buildColumnText('Планируется', true),
                  buildColumnText('В процессе', false),
                  buildColumnText('Завершенные', false),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  buildColumnItem(
                    context,
                    Provider.of<TrelloTaskModel>(context).getPlanningTasks(),
                    true,
                  ),
                  buildColumnItem(
                    context,
                    Provider.of<TrelloTaskModel>(context).getInProcessTasks(),
                    false,
                  ),
                  buildColumnItem(
                    context,
                    Provider.of<TrelloTaskModel>(context).getDoneTasks(),
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildColumnText(String text, bool hasButton) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: headline1,
              textAlign: TextAlign.center,
            ),
            if (hasButton)
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.add,
                  size: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Expanded buildColumnItem(BuildContext context, List<TrelloTask> tasks, bool hasButton) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: hasButton ? tasks.length + 1 : tasks.length,
          itemBuilder: (context, index) {
            if (hasButton) {
              if (index == tasks.length) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                    },
                    child: Row(
                      children: [
                        Text(
                          'Добавить',
                          style: headline2.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.add, size: 24),
                      ],
                    ),
                  ),
                );
              } else {
                TrelloTask task = tasks[index];
                return ColumnItem(task: task);
              }
            } else {
              TrelloTask task = tasks[index];
              return ColumnItem(task: task);
            }
          },
        ),
      ),
    );
  }
}
