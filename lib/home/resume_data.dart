import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/utils/util.dart';

// ignore: must_be_immutable
class ResumeData extends StatelessWidget {
  String titulo;
  String dato;
  var icon;
  bool showCircleButton = false;
  final VoidCallback onPressed;
  ResumeData(this.titulo, this.dato,
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.showCircleButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return resumenCard();
  }

  Card resumenCard() {
    return Card(
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 80),
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: const FractionalOffset(1.0, 0.0),
                      child: const Text("\$",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "Lato",
                              color: Colors.green)),
                    ),
                    Text(
                      dato,
                      style: const TextStyle(
                          fontSize: 35.0,
                          fontFamily: "Lato",
                          color: Color(0xff23c6da)),
                    ),
                  ],
                ),
              ),
              Text(titulo),
            ],
          ),
          SizedBox(
            width: 80,
          ),
          Container(
            child: HeartBeat(
              beatsPerMinute: 35,
              child: showCircleButton
                  ? CirculeButton(false, icon, 32, Util.color("#FFFFFF"),
                      onPressed: onPressed, iconColor: Util.color("#000000"))
                  : Text(""),
            ),
          )
        ],
      ),
    );
  }
}
