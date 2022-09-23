import 'package:flutter/material.dart';
import 'package:lawhack/constant/text_style.dart';

class DocStorageScreen extends StatefulWidget {
  const DocStorageScreen({super.key});

  @override
  State<DocStorageScreen> createState() => _DocStorageScreenState();
}

class _DocStorageScreenState extends State<DocStorageScreen> {
  List<String> docs = [
    'Excel.xls',
    'Doc.docx',
    'Protocol.pdf',
    'Excel.xls',
    'Doc.docx',
    'Protocol.pdf',
    'Excel.xls',
    'Doc.docx',
    'Protocol.pdf',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Мои документы', style: headline1.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      padding: const EdgeInsets.all(16),
                      child: Text(docs[index], style: headline1),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
