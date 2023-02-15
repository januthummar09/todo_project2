import 'package:flutter/material.dart';
import 'package:todo_project2/common_widget/food_textfild/food_textfild.dart';
import 'package:todo_project2/models/food_demo.dart';
import 'package:todo_project2/utils/global.dart';
import 'package:todo_project2/utils/text_deco.dart';

class TodoAdd3Screen extends StatefulWidget {
  const TodoAdd3Screen({Key? key}) : super(key: key);

  @override
  State<TodoAdd3Screen> createState() => _TodoAdd3ScreenState();
}

class _TodoAdd3ScreenState extends State<TodoAdd3Screen> {
  TextDeco textDeco = TextDeco();

  TextEditingController foodNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heigth = size.height;
    double width = size.width;
    double text = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      backgroundColor: Global.fgColor3,
      appBar: AppBar(
        title: const Text("Food Add Screen"),
        centerTitle: true,
        backgroundColor: Global.bgColor,
        foregroundColor: Global.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "Food Name",
                  style: textDeco.textDecoration(
                    color: const Color(0xff011A51),
                  ),
                ),
                SizedBox(
                  width: width / 30,
                ),
                Expanded(
                  child: FoodTextfild(
                    controller: foodNameController,
                    hintText: "Enter Food Name",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heigth / 30,
            ),
            Row(
              children: [
                Text(
                  "Food Price",
                  style: textDeco.textDecoration(
                    color: const Color(0xff011A51),
                  ),
                ),
                SizedBox(
                  width: width / 30,
                ),
                Expanded(
                  child: FoodTextfild(
                    controller: priceController,
                    hintText: "Enter Food Price",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heigth / 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: ElevatedButton(
                onPressed: () {
                  FoodData foodData = FoodData(
                    foodName: foodNameController.text,
                    price: priceController.text,
                  );
                  Navigator.pop(context, foodData);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Global.bgColor),
                  foregroundColor: MaterialStateProperty.all(Global.white),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text("Submit"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
