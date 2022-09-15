import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mis_gastos/combustible/models/registro_carga_model.dart';
import 'package:mis_gastos/gastos/views/form_gasto.dart';
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
        Container(
          margin: EdgeInsets.only(top: 250),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ResumeData(
                "Ingreso anual",
                numberFormat.format(112984.00).toString(),
                icon: Icons.add,
                onPressed: () => print("press ingreso anual"),
                showCircleButton: false,
              ),
              ResumeData(
                "Ingresos septiembre",
                numberFormat.format(8036).toString(),
                icon: Icons.attach_money_rounded,
                onPressed: () => print("Nuevo ingreso mensual"),
                showCircleButton: false,
              ),
              ResumeData("Gastos", numberFormat.format(5800.00).toString(),
                  icon: Icons.money_off,
                  showCircleButton: true,
                  onPressed: () => showDialog(
                      context: context, builder: (context) => FormGasto())),
              ResumeData(
                  "Cargas", numberFormat.format(cargaModel.getTotalImporte()),
                  icon: Icons.car_repair,
                  showCircleButton: false,
                  onPressed: () => print("Nueva carga")),
            ],
          ),
        )
      ],
    );
  }
}
