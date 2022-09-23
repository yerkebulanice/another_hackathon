import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Dashboard', Icons.dashboard, Colors.teal),
  Destination('Почта', Icons.mail, Colors.cyan),
  Destination('Календарь', Icons.calendar_month, Colors.orange),
  Destination('Мои документы', Icons.description, Colors.blue)
];
