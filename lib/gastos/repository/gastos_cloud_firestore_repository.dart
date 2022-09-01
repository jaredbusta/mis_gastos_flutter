import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/gastos/repository/cloud_firestore_api.dart';

class GastosCloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  Future<void> updateGastoDataFirestore(GastoModel gasto) =>
      _cloudFirestoreApi.updateGastoDataFirestore(gasto);
  Future<void> getMisGastos() => _cloudFirestoreApi.getMisGastos();
}
