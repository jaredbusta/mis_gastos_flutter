import 'package:flutter/material.dart';

class IngresoModel {
  String uid;
  final String concepto;
  final String fecha;
  final double importe;
  final String observaciones;

  IngresoModel(
      {Key? key,
      required this.concepto,
      required this.fecha,
      required this.importe,
      required this.observaciones,
      required this.uid});
}
