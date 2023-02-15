import 'package:flutter/material.dart';
import 'package:todo_project2/common_widget/stu_textfild/todo_textfild.dart';
import 'package:todo_project2/models/student_demo.dart';
import 'package:todo_project2/utils/global.dart';
import 'package:todo_project2/utils/text_deco.dart';

class TodoAddScreen extends StatefulWidget {
  final StudentDemo? item;
  const TodoAddScreen({Key? key, this.item}) : super(key: key);

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  TextDeco textDeco = TextDeco();

  TextEditingController nameController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController feesController = TextEditingController();

  @override
  void initState() {
    editData();

    super.initState();
  }

  editData() {
    if (widget.item != null) {
      nameController.text = widget.item!.name!;
      facultyController.text = widget.item!.facultyName!;
      courseController.text = widget.item!.course!;
      feesController.text = widget.item!.fees!;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Todo ADD Screen"),
        backgroundColor: Global.bgColor,
        foregroundColor: Global.fgColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 420,
        ).copyWith(
          top: 10,
        ),
        children: [
          SizedBox(
            height: heigth / 30,
          ),
          Text(
            "Student Detail",
            textAlign: TextAlign.center,
            style: textDeco.textDecoration(
              fontWeight: FontWeight.w500,
              size: 30,
            ),
          ),
          SizedBox(
            height: heigth / 30,
          ),
          ToDoTextfiled(
            controller: nameController,
            hintText: 'Enter Student Name',
          ),
          SizedBox(
            height: heigth / 30,
          ),
          ToDoTextfiled(
            controller: facultyController,
            hintText: 'Enter Faculty Name',
          ),
          SizedBox(
            height: heigth / 30,
          ),
          ToDoTextfiled(
            controller: courseController,
            hintText: 'Enter Course',
          ),
          SizedBox(
            height: heigth / 30,
          ),
          ToDoTextfiled(
            controller: feesController,
            hintText: 'Enter Fees',
          ),
          SizedBox(
            height: heigth / 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 120,
            ),
            child: ElevatedButton(
              onPressed: () {
                StudentDemo studentDemo = StudentDemo(
                  name: nameController.text,
                  facultyName: facultyController.text,
                  course: courseController.text,
                  fees: feesController.text,
                );

                Navigator.pop(context, studentDemo);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Global.bgColor),
                foregroundColor: MaterialStateProperty.all(Global.fgColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: Text(
                  'Submit',
                  style: textDeco.textDecoration(
                    size: 20,
                    color: Global.fgColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
