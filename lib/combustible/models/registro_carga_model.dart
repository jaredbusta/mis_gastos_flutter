import '../repository/repository_cargas.dart';

class RegistroCargaModel {
  String fecha = "";
  double litros = 0;
  double importe = 0;
  String combustible = "";
  String lugar = "";
  // ignore: non_constant_identifier_names
  double distacia_recorrida = 0;
  UnidadDistacia unidad = UnidadDistacia.millas;

  RepositoryCargas cargas = RepositoryCargas();

  RegistroCargaModel.single() {}
  RegistroCargaModel(this.fecha, this.lugar, this.litros, this.importe,
      this.combustible, this.distacia_recorrida, this.unidad) {
    fecha = fecha;
  }

  List getListaCargas() {
    return cargas.getCargas();
  }

  double getTotalImporte() {
    List cargas = getListaCargas();
    double total = 0;
    for (int i = 0; i < cargas.length; i++) {
      total += cargas[i].importe;
    }
    return total;
  }
}

enum UnidadDistacia { millas, km }
