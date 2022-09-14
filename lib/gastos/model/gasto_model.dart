import 'package:flutter/material.dart';

class GastoModel {
  final String concepto;
  final String descripcion;
  final DateTime fecha;
  final double importe;
  final String categoria;

  GastoModel({
    Key? key,
    required this.concepto,
    required this.descripcion,
    required this.fecha,
    required this.importe,
    required this.categoria,
  });

  List<GastoModel> init() {
    List<GastoModel> gastos = <GastoModel>[];
    gastos.add(GastoModel(
        concepto: "camioncito",
        descripcion: "Linea 17 a la chamba",
        fecha: DateTime(2022, 08, 01),
        importe: 9.0,
        categoria: "Transporte"));
    gastos.add(GastoModel(
        concepto: "pizza",
        descripcion: "lirusisar",
        fecha: DateTime(2022, 08, 03),
        importe: 89.0,
        categoria: "Alimentacion"));
    return gastos;
  }

  Map<String, dynamic> toMap() {
    return {
      'concepto': concepto,
      'descripcion': descripcion,
      'fecha': fecha,
      'importe': importe,
      'categoria': categoria
    };
  }
}
