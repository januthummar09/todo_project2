import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_project2/models/student_demo.dart';
import 'package:todo_project2/screens/todo_project2/remove_todo_screen.dart';
import 'package:todo_project2/screens/todo_project2/todo_add_screen.dart';
import 'package:todo_project2/utils/constant.dart';
import 'package:todo_project2/utils/global.dart';
import 'package:todo_project2/utils/text_deco.dart';

import 'complete_todo_screen.dart';

class TodoDisplayScreen extends StatefulWidget {
  const TodoDisplayScreen({Key? key}) : super(key: key);

  @override
  State<TodoDisplayScreen> createState() => _TodoDisplayScreenState();
}

class _TodoDisplayScreenState extends State<TodoDisplayScreen> {
  TextDeco textDeco = TextDeco();

  List<StudentDemo> stdList = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.bgColor,
        foregroundColor: Global.fgColor,
        title: const Text("Todo Display Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompleteTodoScreen(),
                ),
              );
            },
            icon: const Icon(Icons.done),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RemoveTodoScreen(),
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: stdList.isEmpty
          ? Center(
              child: Text(
                "No Student Data",
                style: textDeco.textDecoration(
                  size: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        color: index % 2 == 0 ? Global.fgColor : Global.bgColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 15,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name   :  ${stdList[index].name}",
                                        style: textDeco.textDecoration(
                                          color: textColor(index),
                                          fontWeight: FontWeight.w400,
                                          size: 25,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: height / 50,
                                      ),
                                      Text(
                                        "Faculty         :  ${stdList[index].facultyName}",
                                        style: textDeco.textDecoration(
                                          color: textColor(index),
                                          size: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 70,
                                      ),
                                      Text(
                                        "Course         :  ${stdList[index].course}",
                                        style: textDeco.textDecoration(
                                          color: textColor(index),
                                          size: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: height / 70,
                                      ),
                                      Text(
                                        "Fees.            :  ${stdList[index].fees}",
                                        style: textDeco.textDecoration(
                                          color: textColor(index),
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          completeStdList.add(stdList[index]);
                                          stdList.removeAt(index);
                                          debugPrint(
                                              "total list---------->>$stdList");
                                          debugPrint(
                                              "complate list----------->>$completeStdList");
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.save),
                                        iconSize: 25,
                                        color: textColor(index),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          dynamic editData =
                                              await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TodoAddScreen(
                                                item: stdList[index],
                                              ),
                                            ),
                                          );
                                          if (editData != null) {
                                            stdList[index] = editData;
                                            setState(() {});
                                          }
                                        },
                                        icon: const Icon(Icons.edit),
                                        color: textColor(index),
                                        iconSize: 25,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          removeStdList.add(stdList[index]);
                                          stdList.removeAt(index);
                                          setState(() {});
                                          debugPrint("remove------>>$stdList");
                                        },
                                        icon: const Icon(Icons.delete),
                                        color: textColor(index),
                                        iconSize: 25,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: height / 30,
                        ),
                    itemCount: stdList.length)
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TodoAddScreen(),
            ),
          );
          if (data != null) {
            stdList.add(data);
            setState(() {
              debugPrint("Main  List------------------>$stdList");
              debugPrint("Main  data------------------>$data");
            });
          }
        },
        backgroundColor: Global.bgColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  textColor(int index) {
    return index % 2 == 0 ? Global.bgColor : Global.fgColor;
  }
}
