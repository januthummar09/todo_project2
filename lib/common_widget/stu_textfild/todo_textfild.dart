import 'package:flutter/material.dart';
import 'package:todo_project2/utils/global.dart';

class ToDoTextfiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final bool? enable;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  const ToDoTextfiled({
    Key? key,
    this.controller,
    this.hintText,
    this.enable,
    this.suffixIcon,
    this.maxLines,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enable ?? true,
      controller: controller,
      cursorColor: Global.bgColor,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff383c42),
            fontSize: 14,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Global.fgColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                // color: Color(0xff383c42),
                color: Global.bgColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          )),
    );
  }
}
