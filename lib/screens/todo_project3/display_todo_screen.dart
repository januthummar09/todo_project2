import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_project2/models/food_demo.dart';
import 'package:todo_project2/screens/todo_project3/todo_add3_screen.dart';
import 'package:todo_project2/utils/global.dart';
import 'package:todo_project2/utils/text_deco.dart';
import 'package:todo_project2/utils/todo_project3/food_constant.dart';

import 'complete3_todo_screen.dart';

class DisplayTodoScreen extends StatefulWidget {
  const DisplayTodoScreen({Key? key}) : super(key: key);

  @override
  State<DisplayTodoScreen> createState() => _DisplayTodoScreenState();
}

class _DisplayTodoScreenState extends State<DisplayTodoScreen> {
  TextDeco textDeco = TextDeco();

  List<FoodData> foodList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Detail Screen"),
        centerTitle: true,
        backgroundColor: Global.bgColor,
        foregroundColor: Global.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Complete3TodoScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.done),
            ),
          ),
        ],
      ),
      body: foodList.isEmpty
          ? Center(
              child: Text(
                "No Data Found",
                style: textDeco.textDecoration(
                  size: 25,
                  color: Global.bgColor3,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return Slidable(
                    key: const ValueKey(0),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            foodList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      dismissible: DismissiblePane(
                        onDismissed: () {
                          completeFoodList.add(foodList[index]);
                          foodList.removeAt(index);
                          setState(() {});
                        },
                      ),
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            completeFoodList.add(foodList[index]);
                            foodList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: const Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      tileColor: Global.fgColor3,
                      title: Text(
                        "Food Name :${foodList[index].foodName}",
                        style: textDeco.textDecoration(),
                      ),
                      subtitle: Text(
                        "Food price   :${foodList[index].price}",
                        style: textDeco.textDecoration(
                          size: 17,
                        ),
                      ),
                    ));
              },
              separatorBuilder: (context, index) => SizedBox(
                height: heigth / 50,
              ),
              itemCount: foodList.length,
            ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: ElevatedButton(
            onPressed: () async {
              dynamic data = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodoAdd3Screen(),
                ),
              );
              if (data != null) {
                foodList.add(data);
                setState(() {});
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Global.bgColor),
              foregroundColor: MaterialStateProperty.all(Global.white),
            ),
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
