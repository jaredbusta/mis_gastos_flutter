import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';
import 'package:intl/intl.dart';
import 'package:mis_gastos/gastos/views/form_gasto.dart';
import 'package:mis_gastos/home/models/totales_dashboard.dart';
import 'package:mis_gastos/screens/gradient_back.dart';
import 'resume_data.dart';

// ignore: must_be_immutable
class AppHeader extends StatelessWidget {
  final numberFormat = NumberFormat("##,##0.00", "en_US");

  TotalesDasboard totalesDasboard = new TotalesDasboard(
      totalIngresoAnual: 112984,
      totalIngresosMes: 8036,
      totalGastos: 5800,
      totalCargas: 2197.80);

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
            child: Fade(child: getTotales(context, totalesDasboard))),
      ],
    );
  }

  Widget getTotales(BuildContext context, TotalesDasboard totalesDasboard) {
    return ListView(
      children: [
        ResumeData(
          "Ingreso anual",
          numberFormat.format(totalesDasboard.totalIngresoAnual).toString(),
          icon: Icons.add,
          onPressed: () => print("press ingreso anual"),
          showCircleButton: false,
        ),
        ResumeData(
          "Ingresos septiembre",
          numberFormat.format(totalesDasboard.totalIngresosMes).toString(),
          icon: Icons.attach_money_rounded,
          onPressed: () => print("Nuevo ingreso mensual"),
          showCircleButton: false,
        ),
        ResumeData("Gastos",
            numberFormat.format(totalesDasboard.totalGastos).toString(),
            icon: Icons.money_off,
            showCircleButton: true,
            onPressed: () => showDialog(
                context: context, builder: (context) => FormGasto())),
        ResumeData("Cargas", numberFormat.format(totalesDasboard.totalCargas),
            icon: Icons.car_repair,
            showCircleButton: false,
            onPressed: () => print("Nueva carga")),
      ],
    );
  }
}
