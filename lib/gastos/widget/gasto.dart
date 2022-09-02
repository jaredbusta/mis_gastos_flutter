import 'package:flutter/material.dart';

class Gasto extends StatelessWidget {
  String importe;
  String fecha;
  String concepto;
  Gasto(this.importe, this.fecha, this.concepto);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: gastoCard(),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 15, color: Colors.black26)],
      ),
    );
  }

  Card gastoCard() {
    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: FractionalOffset(1.0, 0.0),
                  child: Text("\$",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Lato",
                          color: Colors.black38)),
                ),
                Text(
                  this.importe,
                  style: TextStyle(
                      fontSize: 25.0, fontFamily: "Lato", color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0, left: 20.0),
            child: Column(
              children: [
                Text(
                  this.fecha,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  this.concepto,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
