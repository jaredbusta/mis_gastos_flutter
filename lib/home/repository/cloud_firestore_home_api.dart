import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/gastos/widget/gasto_card.dart';
import '../../User/repository/cloud_firestore_api.dart';

// obtiene los siguientes totales:
// Ingreso anual
// Ingreso menusal
// Gasto anual
// Gasto mensual
// Cargas anuales
// Cargas menuales
//
class CloudFirestoreHomeApi {
  final String GASTO_TABLE = "gastos"; // collection
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> getMisGastos(
      {Key? key, required start, required isMensual}) {
    var user = _auth.currentUser;
    final ref = this
        ._db
        .collection(GASTO_TABLE)
        .where("fecha", isGreaterThanOrEqualTo: start)
        .where("owner", isEqualTo: "users/${user!.uid}")
        .orderBy("fecha", descending: true);
    return ref.snapshots();
  }

  List<GastoCard> buildMyGastosCard(List<DocumentSnapshot> gastosListSnapshot) {
    List<GastoCard> lista = <GastoCard>[];
    gastosListSnapshot.forEach((p) {
      print(p.data());
    });

    return lista;
  }
}
