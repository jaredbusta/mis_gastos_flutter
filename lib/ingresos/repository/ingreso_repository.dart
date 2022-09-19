import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mis_gastos/ingresos/model/ingreso_model.dart';
import 'package:mis_gastos/ingresos/repository/cloud_repository_ingreso_api.dart';

class IngresoRepository {
  final _cloudFirestoreApi = CloudRepositoryIngresoApi();
  Future<void> nuevoIngreso(IngresoModel ingreso) =>
      _cloudFirestoreApi.nuevoIngresoFirestore(ingreso);
  Stream<QuerySnapshot> getMisGastos(start, end, category) => _cloudFirestoreApi
      .getMisGastos(end: end, start: start, category: category);

  // List<GastoCard> buildMyGastosCard(List<DocumentSnapshot> gastosSnapshot) =>
  //     _cloudFirestoreApi.buildMyGastosCard(gastosSnapshot);
}
