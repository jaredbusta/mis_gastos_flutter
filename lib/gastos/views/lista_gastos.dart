import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/gastos/views/form_gasto.dart';
import 'package:mis_gastos/gastos/views/importa_csv_gastos.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/screens/widgets/title_header.dart';
import 'package:mis_gastos/utils/util.dart';
import '../widget/gasto.dart';
import '../../screens/gradient_back.dart';

class ListaGastos extends StatelessWidget {
  late UserBloc userBloc;
  ListaGastos({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    // userBloc.getMisGastos();

    return stack(context);
  }

  stack(BuildContext context) {
    return Stack(
      children: [
        GradientBack(
            title: " ",
            height: MediaQuery.of(context).size.height,
            color1: "#CFCFCF",
            color2: "#F3F3F3"),
        GradientBack(
            title: "", height: 150, color1: "#F75454", color2: "#E33131"),
        // Container(
        //   padding: EdgeInsets.only(top: 80, left: 100, right: 10.0),
        //   child: TitleHeader(title: "Mis gastos"),
        // ),
        Container(
          padding: const EdgeInsets.only(top: 140),
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Gasto("9.00", "01 ago", "camioncito "),
              Gasto("275.00", "02 ago", "arroz, pasta, puré, desodorante x4"),
              Gasto("89.00", "03 ago", "pizza del lirusisar"),
              Gasto("9.00", "04 ago", "camioncito"),
              Gasto("9.00", "05 ago", "camioncito"),
              Gasto("9.00", "05 ago", "camioncito"),
              Gasto("150.00", "06 ago", "bongles con fers"),
              Gasto("16.65", "07 ago", "tomate"),
              Gasto("280.00", "07 ago", "verduras del mercado"),
              Gasto("102.00", "07 ago", "pan y huevos del soriana"),
              Gasto("20.00", "07 ago", "2 garrafones de agua"),
              Gasto("9.00", "08 ago", "camioncito"),
              Gasto("9.00", "09 ago", "camioncito"),
              Gasto("23.00", "09 ago", "galletas emperador chocolate"),
              Gasto("9.00", "10 ago", "camioncito"),
              Gasto("9.00", "11 ago", "camioncito"),
              Gasto("9.00", "12 ago", "camioncito"),
              Gasto("50.00", "12 ago", "despedida de Darío"),
              Gasto("150.00", "12 ago", "cumpleaños de abue"),
              Gasto("459.00", "12 ago", "Internet"),
              Gasto("374.27", "13 ago", "Mandado del ley"),
              Gasto("9.00", "15 ago", "camioncito"),
              Gasto("9.00", "16 ago", "camioncito"),
              Gasto("9.00", "17 ago", "camioncito"),
              Gasto("36.00", "17 ago", "tortillas de harina de la tienda"),
              Gasto("9.00", "18 ago", "camioncito"),
              Gasto("9.00", "19 ago", "camioncito"),
              Gasto("701.00", "20 ago", "CFE"),
              Gasto("78.00", "20 ago", "3 kg papa"),
              Gasto("216.78", "20 ago", "Verdudas del mercado"),
              Gasto("9.00", "22 ago", "camioncito"),
              Gasto("9.00", "23 ago", "camioncito"),
              Gasto("9.00", "24 ago", "camioncito"),
              Gasto("100.00", "24 ago", "comida china"),
              Gasto("200.00", "25 ago", "Mecanico"),
              Gasto("215.00", "25 ago", "Ensalada"),
              Gasto("9.00", "25 ago", "camioncito"),
              Gasto("9.00", "26 ago", "camioncito"),
              Gasto("100.00", "26 ago", "Queso y carne LEY"),
              Gasto("100.00", "26 ago", "Gas LP"),
              Gasto("89.00", "31 ago", "pizza lirusisar"),
              Gasto("287.00", "1 sep", "Recibo del agua"),
            ],
          ),
        ),
        Container(
          alignment: Alignment(0.9, -0.6),
          child: SizedBox(
              width: 50,
              height: 50,
              child: CirculeButton(
                  false, Icons.upload_file, 32, Util.color("#FFFFFF"),
                  onPressed: () => {goToImportaCSV(context)},
                  iconColor: Util.color("#000000"))),
        ),
        Container(
          alignment: Alignment(0.93, 0.9),
          child: SizedBox(
              width: 50,
              height: 50,
              child: CirculeButton(false, Icons.add, 32, Util.color("#FFFFFF"),
                  onPressed: () => {goToForm(context)},
                  iconColor: Util.color("#000000"))),
        ),
      ],
    );
  }

  goToForm(BuildContext context) {
    File? image;
    showDialog(context: context, builder: (context) => FormGasto());

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (BuildContext context) => AddGastoScreen(image: image)));
  }

  goToImportaCSV(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ImportaCSVGastos()));
  }
}
