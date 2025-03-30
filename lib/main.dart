import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/citation_view_model.dart';
import 'viewmodels/reference_view_model.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CitationViewModel()),
        ChangeNotifierProvider(create: (_) => ReferenceViewModel()),
      ],
      child: MaterialApp(
        title: 'Citeasy Lite',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeView(),
      ),
    );
  }
}
