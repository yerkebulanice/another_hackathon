import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawhack/features/main/screens/main_screen.dart';
import 'package:lawhack/features/trello/models/trello_task_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TrelloTaskModel()),
  ], child: const LawHackApp()));
}

class LawHackApp extends StatelessWidget {
  const LawHackApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen()));
  }
}
