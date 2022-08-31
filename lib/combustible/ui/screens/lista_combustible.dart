import 'package:flutter/material.dart';
import '../widgets/carga.dart';
import '../../models/registro_carga_model.dart';

// ignore: must_be_immutable
class ListaCombustible extends StatelessWidget {
  RegistroCargaModel model = RegistroCargaModel.single();

  ListaCombustible({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List cargas = model.getListaCargas();
    List<Carga> widgetCargas = [];
    for (int i = 0; i < cargas.length; i++) {
      widgetCargas.add(Carga(cargas[i]));
    }

    return ListView(
      children: widgetCargas,
    );
  }
}
