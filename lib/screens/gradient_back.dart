import 'package:flutter/material.dart';
import 'package:mis_gastos/utils/util.dart';

// ignore: must_be_immutable
class GradientBack extends StatelessWidget {
  String title = "";
  double height = 0.0;
  String color1;
  String color2;

  GradientBack(
      {Key? key,
      required this.title,
      required this.height,
      this.color1 = "#4268d3",
      this.color2 = "#584cd1"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (height == double.infinity) height = screenHeight;

    return Container(
        width: screenWidth,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(Util.color(color1)),
                  Color(Util.color(color2)),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        alignment: const Alignment(-0.9, -0.6),
        child: FittedBox(
          fit: BoxFit.none,
          alignment: Alignment(-15, -0.8),
          child: Container(
            width: screenHeight,
            height: screenHeight,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                borderRadius: BorderRadius.circular(screenHeight / 2)),
          ),
          // child: Text(
          //   title,
          //   style: const TextStyle(
          //       color: Colors.white,
          //       fontSize: 30.0,
          //       fontFamily: "Lato",
          //       fontWeight: FontWeight.w900),
          // ),
        ));
  }
}
