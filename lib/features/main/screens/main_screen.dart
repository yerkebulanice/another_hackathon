import 'package:flutter/material.dart';
import 'package:lawhack/constant/bottom_navigation.dart';
import 'package:lawhack/features/calendar/screens/calendar_screen.dart';
import 'package:lawhack/features/doc_storage/screens/doc_storage_screen.dart';
import 'package:lawhack/features/mail/screens/mail_screen.dart';
import 'package:lawhack/features/trello/screens/trello_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            label: destination.title,
          );
        }).toList(),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            TrelloScreen(),
            MailScreen(),
            CalendarScreen(),
            DocStorageScreen(),
          ],
        ),
      ),
    );
  }
}
