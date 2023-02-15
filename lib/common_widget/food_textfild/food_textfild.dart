import 'package:flutter/material.dart';
import 'package:todo_project2/utils/global.dart';

class FoodTextfild extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? enable;
  final VoidCallback? onTap;

  const FoodTextfild(
      {Key? key, this.controller, this.hintText, this.enable, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff011A51),
      enabled: enable ?? true,
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Global.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff011A51),
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            // color: Color(0xff383c42),
            color: Color(0xff011A51),
            width: 0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
    );
  }
}
