import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/gastos/repository/cloud_firestore_api.dart';
import 'package:mis_gastos/gastos/widget/gasto_card.dart';

class GastosCloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  Future<void> updateGastoDataFirestore(GastoModel gasto) =>
      _cloudFirestoreApi.updateGastoDataFirestore(gasto);
  Stream<QuerySnapshot> getMisGastos(start, end, category) => _cloudFirestoreApi
      .getMisGastos(end: end, start: start, category: category);

  List<GastoCard> buildMyGastosCard(List<DocumentSnapshot> gastosSnapshot) =>
      _cloudFirestoreApi.buildMyGastosCard(gastosSnapshot);
}
