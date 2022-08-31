import 'package:flutter/material.dart';

class UserModel {
  final String? uid;
  final String nombre;
  final String email;
  final String photoUrl;

  UserModel(
      {Key? key,
      this.uid,
      required this.nombre,
      required this.email,
      required this.photoUrl});

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'nombre': nombre, 'email': email, 'photoUrl': photoUrl};
  }
}
