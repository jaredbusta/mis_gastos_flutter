import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  int? maxLine = 1;

  TextFormFieldCustom(
      {Key? key,
      required this.hintText,
      required this.inputType,
      required this.controller,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        child: TextFormField(
            onChanged: (value) {},
            controller: controller,
            keyboardType: inputType,
            maxLines: maxLine,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Lato",
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                // filled: false,
                fillColor: Color(0xffe5e5e5),
                border: OutlineInputBorder(),
                labelText: hintText,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe5e5e5)),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe5e5e5)),
                    borderRadius: BorderRadius.all(Radius.circular(9))))));
  }
}
