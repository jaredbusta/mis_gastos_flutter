import 'package:flutter/material.dart';

class InputIcon extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final IconData iconData;

  InputIcon(
      {Key? key,
      required this.hintText,
      required this.inputType,
      required this.controller,
      required this.iconData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: 1,
        style: TextStyle(
          fontSize: 15,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData),
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 7.0))
      ]),
    );
  }
}
