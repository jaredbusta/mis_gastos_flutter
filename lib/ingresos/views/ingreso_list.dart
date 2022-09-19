import 'package:flutter/material.dart';
import 'package:mis_gastos/screens/gradient_back.dart';

import 'package:mis_gastos/screens/widgets/title_header.dart';

import '../widgets/ingreso_card.dart';

class IngresoList extends StatelessWidget {
  const IngresoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GradientBack(
        height: 150,
        title: "",
        color1: "#4268D3",
        color2: "#584CD1",
      ),
      Container(
          height: 180,
          margin: EdgeInsets.only(top: 10),
          child: Image.asset("assets/img/ingreso.png")),
      Container(
        padding: EdgeInsets.only(top: 70, left: 140),
        child: TitleHeader(title: "Mis ingresos"),
      ),
      Container(
        padding: const EdgeInsets.only(top: 150),
        child: ListView(
          children: [
            IngresoCard("17 ene 22", "nomina", "8,036.00", 2),
            IngresoCard("13 ene 22", "nomina", "8,036.00", 3),
            IngresoCard("15 feb 22", "nomina", "8,036.00", 4),
            IngresoCard("28 feb 22", "nomina", "8,036.00", 5),
            IngresoCard("18 mar 22", "nomina", "8,036.00", 5),
            IngresoCard("05 abr 22", "nomina", "8,036.00", 5),
            IngresoCard("13 abr 22", "nomina", "8,036.00", 5),
            IngresoCard("29 abr 22", "nomina", "8,036.00", 5),
            IngresoCard("13 may 22", "nomina", "8,036.00", 5),
            IngresoCard("31 may 22", "nomina", "8,036.00", 5),
            IngresoCard("15 jun 22", "nomina", "8,036.00", 5),
            IngresoCard("30 jun 22", "nomina", "8,036.00", 5),
            IngresoCard("30 jun 22", "recuperacion contraseña jefa del isaac",
                "500.00", 5),
            IngresoCard("15 jul 22", "nomina", "8,031.00", 5),
            IngresoCard("30 jul 22", "nomina", "8,036.00", 5),
            IngresoCard("15 ago 22", "nomina", "8,036.00", 5),
            IngresoCard("31 ago 22", "nomina", "8,786.00", 5),
            IngresoCard("51 sep 22", "nomina", "8,786.00", 5),
          ],
        ),
      )
    ]);
  }
}
