import 'package:flutter/material.dart';
import 'package:todo_project2/screens/todo_project2/splesh_screen.dart';
import 'package:todo_project2/screens/todo_project3/splesh3_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splesh3Screen(),
    );
  }
}
