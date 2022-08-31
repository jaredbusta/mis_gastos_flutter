import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResumeData extends StatelessWidget {
  String titulo;
  String dato;
  ResumeData(this.titulo, this.dato, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return resumenCard();
  }

  Card resumenCard() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
          Text(titulo)
        ],
      ),
    );
  }
}
