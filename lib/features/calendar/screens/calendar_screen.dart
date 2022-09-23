import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late EventController<Object?> controller;
  @override
  void initState() {
    controller = EventController();
    final event = CalendarEventData(
      date: DateTime(2022, 9, 24),
      event: "Event 1",
      title: 'Ежемесячное заседания совета директоров',
    );

    controller.add(event);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: controller,
      child: const MonthView(),
    );
  }
}
