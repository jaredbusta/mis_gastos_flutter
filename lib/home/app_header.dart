import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mis_gastos/combustible/models/registro_carga_model.dart';
import 'package:mis_gastos/screens/gradient_back.dart';
import 'resume_data.dart';

// ignore: must_be_immutable
class AppHeader extends StatelessWidget {
  RegistroCargaModel cargaModel = RegistroCargaModel.single();
  final numberFormat = NumberFormat("##,##0.00", "en_US");

  AppHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack(
          height: 250,
          title: '',
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ResumeData(
                "Ingreso anual", numberFormat.format(112984.00).toString()),
            ResumeData("Ingresos agosto", numberFormat.format(8036).toString()),
            ResumeData("Gastos", numberFormat.format(5800.00).toString()),
            ResumeData(
                "Cargas", numberFormat.format(cargaModel.getTotalImporte())),
          ],
        )
      ],
    );
  }
}
