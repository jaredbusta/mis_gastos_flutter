import 'package:flutter/material.dart';
import 'package:mis_gastos/screens/gradient_back.dart';
import 'package:mis_gastos/screens/widgets/title_header.dart';
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

    return Stack(
      children: [
        GradientBack(
            title: " ",
            height: MediaQuery.of(context).size.height,
            color1: "#CFCFCF",
            color2: "#F3F3F3"),
        GradientBack(
            title: "", height: 150, color1: "#42B81D", color2: "#278908"),
        Container(
            height: 130,
            margin: EdgeInsets.only(top: 15, left: 230),
            child: Image.asset("assets/img/cargas.png")),
        Container(
          padding: EdgeInsets.only(top: 50, left: 40, right: 10.0),
          child: TitleHeader(title: "Mis Cargas de \n gasolina"),
        ),
        Container(
          padding: const EdgeInsets.only(top: 150),
          child: ListView(
            children: widgetCargas,
          ),
        ),
      ],
    );
  }
}
