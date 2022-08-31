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
