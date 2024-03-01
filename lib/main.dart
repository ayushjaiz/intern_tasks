import 'package:flutter/material.dart';
import 'package:intern_tasks/views/restaurant_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Restaurant(),
    );
  }
}
