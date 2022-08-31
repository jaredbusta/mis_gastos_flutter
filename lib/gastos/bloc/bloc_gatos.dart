import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/gastos/repository/gastos_cloud_firestore_repository.dart';

class BlocGastos implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  // casos de uso
  // update gasto en base de datos
  final _cloudFirestoreRepository = GastosCloudFirestoreRepository();
  Future<void> updateGastoData(GastoModel gasto) =>
      _cloudFirestoreRepository.updateGastoDataFirestore(gasto);
}
