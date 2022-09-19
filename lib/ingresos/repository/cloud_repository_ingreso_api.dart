import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mis_gastos/User/repository/cloud_firestore_api.dart';
import 'package:mis_gastos/ingresos/model/ingreso_model.dart';

class CloudRepositoryIngresoApi {
  final String INGRESOS_TABLE = "ingresos"; // collection
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> nuevoIngresoFirestore(IngresoModel ingreso) async {
    // DocumentReference ref = this._db.collection(GASTO_TABLE).doc(gasto.uid);
    DocumentReference ref = this._db.collection(INGRESOS_TABLE).doc();
    // user repository
    CloudFirestoreAPIUser userRepositoryFirestore = new CloudFirestoreAPIUser();

    var user = _auth.currentUser;
    if (user != null) {
      await ref.set({
        ...ingreso.toMap(),
        "owner": "${userRepositoryFirestore.USERS}/${user.uid}"
      });
    } else {
      print("No hay usuario logeado ...");
    }
  }

  Stream<QuerySnapshot> getMisGastos(
      {Key? key, required start, required end, category}) {
    var user = _auth.currentUser;
    final ref = this
        ._db
        .collection(INGRESOS_TABLE)
        .where("fecha", isGreaterThanOrEqualTo: start)
        .where("fecha", isLessThanOrEqualTo: end)
        .where("owner", isEqualTo: "users/${user!.uid}")
        .orderBy("fecha", descending: true);
    return ref.snapshots();
  }
}
