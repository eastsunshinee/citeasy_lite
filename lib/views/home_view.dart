import 'package:flutter/material.dart';
import '../models/citation.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
    

  final List<Citation> dummyCitations = [
    Citation(title: '딥러닝의 이해', author: '홍길동', year: '2023', source: 'DBpia'),
    Citation(title: 'AI 혁명', author: '이순신', year: '2022', source: 'KISS'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citeasy Lite'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO: 설정 화면 이동
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: dummyCitations.length,
        itemBuilder: (context, index) {
          final citation = dummyCitations[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(citation.title),
              subtitle: Text('${citation.author} • ${citation.year} • ${citation.source}'),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  final formatted = '${citation.author} (${citation.year}). ${citation.title}. ${citation.source}.';
                  Clipboard.setData(ClipboardData(text: formatted));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('인용문이 복사되었습니다')),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: AddCitationView로 이동
        },
      ),
    );
  }
}
