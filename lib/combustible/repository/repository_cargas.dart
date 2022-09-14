import '../models/registro_carga_model.dart';

class RepositoryCargas {
  List<RegistroCargaModel> lista = [];

  List<RegistroCargaModel> getCargas() {
    // insert(Categoria(id: 1, nombre: "nombre", color: "#FF0000"));
    lista.add(RegistroCargaModel("13/may", "San Javier", 20, 485.00, "Premium",
        120, UnidadDistacia.millas));
    lista.add(RegistroCargaModel("01/jun", "Master-Fuell", 20, 425.00, "Magna",
        119.50, UnidadDistacia.millas));
    lista.add(RegistroCargaModel("27/jun", "Master-Fuell", 20, 419.00, "Magna",
        110, UnidadDistacia.millas));
    lista.add(RegistroCargaModel("15/jul", "San Javier", 20, 431.00, "Magna",
        120, UnidadDistacia.millas));
    lista.add(RegistroCargaModel("12/sep", "San Javier", 20, 437.80, "Magna",
        120, UnidadDistacia.millas));

    return lista;
  }

  // insert(Categoria categoria) async {
  //   await DbSing.instance
  //       .insert(Categoria(id: 1, nombre: "Servicios", color: "#FF0000"));
  // }
}
