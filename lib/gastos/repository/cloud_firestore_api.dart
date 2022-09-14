import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/gastos/widget/gasto_card.dart';
import '../../User/repository/cloud_firestore_api.dart';

class CloudFirestoreApi {
  final String GASTO_TABLE = "gastos"; // collection
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> updateGastoDataFirestore(GastoModel gasto) async {
    // DocumentReference ref = this._db.collection(GASTO_TABLE).doc(gasto.uid);
    DocumentReference ref = this._db.collection(GASTO_TABLE).doc();
    // user repository
    CloudFirestoreAPI userRepositoryFirestore = new CloudFirestoreAPI();

    var user = _auth.currentUser;
    if (user != null) {
      await ref.set({
        ...gasto.toMap(),
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
        .collection(GASTO_TABLE)
        // .where("fecha", isGreaterThanOrEqualTo: start)
        // .where("fecha", isLessThanOrEqualTo: end)
        // .where("owner", isEqualTo: "users/${user!.uid}")
        .where("owner",
            isEqualTo: FirebaseFirestore.instance.doc("users/${user!.uid}"));
    // .orderBy("fecha", descending: true);

    if (category.toString().length > 0) {
      print({start, end, category});
      ref.where("categoria", isEqualTo: category);
    }
    var data = ref.snapshots();

    // data.forEach((field) {
    //   field.docs.asMap().forEach((index, data) {
    //     var concepto = data.get("concepto");
    //     print("concepto");
    //     // print(index);
    //     // var productName = field.docs[index]["concepto"];
    //     // print(productName);
    //   });
    // });
    // print("si llega hasta aqui");

    return ref.snapshots(includeMetadataChanges: true);
  }

  List<GastoCard> buildMyGastosCard(List<DocumentSnapshot> gastosListSnapshot) {
    List<GastoCard> lista = <GastoCard>[];
    gastosListSnapshot.forEach((p) {
      print(p.data());
      // GastoModel model = GastoModel(
      //     concepto: p.get("concepto"),
      //     descripcion: p.get("descripcion"),
      //     fecha: p.get("fecha"),
      //     importe: p.get("importe"),
      //     categoria: p.get("categoria"));
      // lista.add(GastoCard(model));
    });

    return lista;
  }
}
