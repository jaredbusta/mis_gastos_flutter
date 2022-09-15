import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mis_gastos/utils/util.dart';

class GastoCard extends StatelessWidget {
  GastoModel model;
  GastoCard(this.model);

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
                  numberFormat.format(this.model.importe),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.only(
                            top: 6, bottom: 6, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          Jiffy(this.model.fecha).yMMMdjm,
                          // Jiffy(this.model.fecha).yMMMd,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20, bottom: 10),
                        padding: EdgeInsets.only(
                            top: 6, bottom: 6, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Color(Util.color("#E5FFBF")),
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          this.model.categoria,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    this.model.concepto,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lato"),
                  ),
                ),
                Text(
                  this.model.descripcion,
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
