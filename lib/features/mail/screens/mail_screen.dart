import 'package:flutter/material.dart';
import 'package:lawhack/constant/text_style.dart';
import 'package:lawhack/features/mail/models/mail_author.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({super.key});

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  List<String> names = ['Очень Важное', 'Важное', 'Среднее'];
  List<List<AuthorOfMail>> listOfMailes = [
    [
      AuthorOfMail(
          name: 'Галия Егемберди',
          text: 'Изменения в презентации на защиту ',
          date: DateTime.now()),
    ],
    [
      AuthorOfMail(
          name: 'Галия Егемберди',
          text: 'Изменения в презентации на защиту ',
          date: DateTime.now()),
    ],
    [
      AuthorOfMail(
          name: 'Галия Егемберди',
          text: 'Изменения в презентации на защиту ',
          date: DateTime.now()),
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Почта', style: headline1),
                  Text('Настройка', style: headline2),
                ],
              ),
              const SizedBox(height: 20),
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                primary: false,
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      padding: const EdgeInsets.all(16),
                      child: Text(names[index], style: headline1),
                    ),
                    children: listOfMailes.map((e) {
                      return ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          separatorBuilder: (context, i) => const SizedBox(height: 10),
                          itemCount: 1,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(e[i].name, style: headline2),
                                      const SizedBox(width: 16),
                                      Text(e[i].text, style: headline1),
                                    ],
                                  ),
                                  Text(
                                    e[i].date.toString().substring(0, 10),
                                    style: headline1,
                                  ),
                                ],
                              ),
                            );
                          });
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
