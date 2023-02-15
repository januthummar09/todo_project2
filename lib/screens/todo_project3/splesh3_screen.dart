import 'package:flutter/material.dart';
import 'package:todo_project2/screens/todo_project3/display_todo_screen.dart';
import 'package:todo_project2/utils/global.dart';

class Splesh3Screen extends StatefulWidget {
  const Splesh3Screen({Key? key}) : super(key: key);

  @override
  State<Splesh3Screen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<Splesh3Screen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DisplayTodoScreen(),
            ),
            (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      backgroundColor: Global.bgColor3,
      body: Center(
        child: Text(
          "TODO Food Project",
          style: TextStyle(
            color: Global.white,
            fontSize: 40,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
