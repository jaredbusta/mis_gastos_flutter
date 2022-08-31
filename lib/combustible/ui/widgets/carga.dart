import 'package:flutter/material.dart';
import '../../models/registro_carga_model.dart';

// ignore: must_be_immutable
class Carga extends StatelessWidget {
  String fecha = "";
  double litros = 0;
  double importe = 0;
  String combustible = "";

  // ignore: non_constant_identifier_names
  double distacia_recorrida = 0;

  // Carga(this.fecha, this.litros, this.importe, this.combustible,
  //     this.distacia_recorrida);
  Carga(RegistroCargaModel carga) {
    fecha = carga.fecha;
    litros = carga.litros;
    importe = carga.importe;
    combustible = carga.combustible;
    distacia_recorrida = carga.distacia_recorrida;
  }

  @override
  Widget build(BuildContext context) {
    return gastoCard();
  }

  double calculaRendimiento() {
    return distacia_recorrida / litros;
  }

  Card gastoCard() {
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
                  child: const Text("",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Lato",
                          color: Colors.black38)),
                ),
                Text(
                  "$combustible - \$ $importe",
                  style: const TextStyle(
                      fontSize: 25.0, fontFamily: "Lato", color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20.0),
            child: Column(
              children: [
                Text(
                  fecha,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$litros litros. ${calculaRendimiento()}",
                  style: const TextStyle(
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
