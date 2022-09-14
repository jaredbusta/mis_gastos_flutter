import 'package:flutter/material.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';

class DemoRepositoryGastos {
  List<GastoModel> lista = [];

  List<GastoModel> getMisGastos() {
    lista.add(GastoModel(
        concepto: "camioncito",
        descripcion: "Linea 17 a la chamba",
        fecha: DateTime(2022, 08, 01),
        importe: 9.0,
        categoria: "Transporte"));
    lista.add(GastoModel(
        concepto: "pizza",
        descripcion: "lirusisar",
        fecha: DateTime(2022, 08, 03),
        importe: 89.0,
        categoria: "Alimentacion"));
    return lista;
  }
}
