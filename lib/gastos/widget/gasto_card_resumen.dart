// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'package:mis_gastos/utils/util.dart';

class GastoCardResumen extends StatelessWidget {
  double total_gasto;
  int cantidad_items;
  GastoCardResumen({
    Key? key,
    required this.total_gasto,
    required this.cantidad_items,
  }) : super(key: key);

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
    final numberFormat = NumberFormat("##,##0.00", "en_US");
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
                  numberFormat.format(this.total_gasto),
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
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    "$cantidad_items registros encontrados.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lato"),
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
