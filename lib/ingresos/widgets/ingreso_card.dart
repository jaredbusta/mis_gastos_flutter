import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IngresoCard extends StatelessWidget {
  String fecha;
  String concepto;
  String cantidad;
  int id;

  IngresoCard(this.fecha, this.concepto, this.cantidad, this.id, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ingresoCard();
  }

  Card ingresoCard() {
    var detalle = Container(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            child: Text(
              fecha,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(" "),
          Flexible(
            child: Text(
              concepto,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
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
                          color: Colors.black38)),
                ),
                Text(
                  cantidad,
                  style: const TextStyle(
                      fontSize: 35.0, fontFamily: "Lato", color: Colors.black),
                ),
              ],
            ),
          ),
          detalle
        ],
      ),
    );
  }
}
