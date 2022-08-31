import 'package:flutter/material.dart';
import 'package:mis_gastos/utils/util.dart';

class ButtonColor extends StatefulWidget {
  late String text = "Botonazo";
  late double height = 60;
  late double width = double.infinity;
  late VoidCallback onPressed = () => print("clickaso");
  late String color1 = "#AFFF71";
  late String color2 = "#73F211";
  late String textColor = "#999999";

  ButtonColor(
      {Key? key,
      required this.width,
      required this.height,
      required this.text,
      required this.color1,
      required this.color2,
      required this.onPressed,
      required this.textColor})
      : super(key: key);

  @override
  State<ButtonColor> createState() => _ButtonColorState();
}

class _ButtonColorState extends State<ButtonColor> {
  _ButtonColorState({Key? key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            gradient: LinearGradient(
                colors: [
                  Color(Util.color(widget.color1)),
                  Color(Util.color(widget.color2)),
                ],
                begin: FractionalOffset(0.4, 0.0),
                end: FractionalOffset(0.1, 0.6),
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Lato",
                color: Color(Util.color(widget.textColor))),
          ),
        ),
      ),
    );
  }
}
