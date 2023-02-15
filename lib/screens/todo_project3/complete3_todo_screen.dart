import 'package:flutter/material.dart';
import 'package:todo_project2/utils/global.dart';
import 'package:todo_project2/utils/todo_project3/food_constant.dart';

class Complete3TodoScreen extends StatefulWidget {
  const Complete3TodoScreen({Key? key}) : super(key: key);

  @override
  State<Complete3TodoScreen> createState() => _Complete3TodoScreenState();
}

class _Complete3TodoScreenState extends State<Complete3TodoScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Add Screen"),
        centerTitle: true,
        backgroundColor: Global.bgColor,
        foregroundColor: Global.white,
      ),
      body: completeFoodList.isEmpty
          ? const Center(
              child: Text("No Data Found"),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                    color: Global.fgColor3,
                    child: Column(
                      children: [
                        Text("Food Name : ${completeFoodList[index].foodName}"),
                        Text("Food Name : ${completeFoodList[index].price}"),
                      ],
                    ));
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: heigth / 10,
                  ),
              itemCount: completeFoodList.length),
    );
  }
}
