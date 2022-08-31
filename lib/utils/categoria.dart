import 'package:flutter/cupertino.dart';

class Categoria {
  String tablaName = "categoria";
  int id;
  String nombre;
  String color;
  Categoria({required this.id, required this.nombre, required this.color});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'color': color};
  }
}
