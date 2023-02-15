import 'package:flutter/material.dart';
import 'package:todo_project2/utils/constant.dart';
import 'package:todo_project2/utils/global.dart';
import 'package:todo_project2/utils/text_deco.dart';

class RemoveTodoScreen extends StatefulWidget {
  const RemoveTodoScreen({Key? key}) : super(key: key);

  @override
  State<RemoveTodoScreen> createState() => _RemoveTodoScreenState();
}

class _RemoveTodoScreenState extends State<RemoveTodoScreen> {
  TextDeco textDeco = TextDeco();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo RemoveData Screen"),
        backgroundColor: Global.bgColor,
        foregroundColor: Global.fgColor,
      ),
      body: removeStdList.isEmpty
          ? Center(
              child: Text(
                "No Found Remove List",
                style: textDeco.textDecoration(
                  size: 30,
                  fontWeight: FontWeight.w500,
                  color: Global.bgColor,
                ),
              ),
            )
          : ListView.separated(
              itemCount: removeStdList.length,
              separatorBuilder: (context, index) => SizedBox(
                height: heigth / 20,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color:
                              index % 2 == 0 ? Global.fgColor : Global.bgColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Text(
                              '${index + 1}',
                              style: textDeco.textDecoration(
                                color: index % 2 == 0
                                    ? Global.bgColor
                                    : Global.fgColor,
                                size: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color:
                              index % 2 == 0 ? Global.bgColor : Global.fgColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Student Name :${removeStdList[index].name}",
                                  style: textDeco.textDecoration(
                                    size: 16,
                                    color: index % 2 == 0
                                        ? Global.fgColor
                                        : Global.bgColor,
                                  ),
                                ),
                                SizedBox(
                                  height: heigth / 90,
                                ),
                                Text(
                                  "Faculty Name :${removeStdList[index].facultyName}",
                                  style: textDeco.textDecoration(
                                    size: 16,
                                    color: index % 2 == 0
                                        ? Global.fgColor
                                        : Global.bgColor,
                                  ),
                                ),
                                SizedBox(
                                  height: heigth / 90,
                                ),
                                Text(
                                  "Course Name :${removeStdList[index].course}",
                                  style: textDeco.textDecoration(
                                    size: 16,
                                    color: index % 2 == 0
                                        ? Global.fgColor
                                        : Global.bgColor,
                                  ),
                                ),
                                SizedBox(
                                  height: heigth / 90,
                                ),
                                Text(
                                  "Fees :${removeStdList[index].fees}",
                                  style: textDeco.textDecoration(
                                    size: 16,
                                    color: index % 2 == 0
                                        ? Global.fgColor
                                        : Global.bgColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
