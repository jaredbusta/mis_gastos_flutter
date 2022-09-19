import 'package:flutter/material.dart';

class IngresoModel {
  String? uid;
  final String concepto;
  final DateTime fecha;
  final double importe;
  final String observaciones;

  IngresoModel(
      {Key? key,
      required this.concepto,
      required this.fecha,
      required this.importe,
      required this.observaciones,
      this.uid});

  Map<String, dynamic> toMap() {
    return {
      'concepto': concepto,
      'observaciones': observaciones,
      'fecha': fecha,
      'importe': importe
    };
  }
}
