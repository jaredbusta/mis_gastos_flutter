import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/gastos/views/form_gasto.dart';
import 'package:mis_gastos/gastos/views/importa_csv_gastos.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/screens/widgets/title_header.dart';
import 'package:mis_gastos/utils/util.dart';
import '../widget/gasto_card.dart';
import '../../screens/gradient_back.dart';

class ListaGastos extends StatelessWidget {
  late UserBloc userBloc;
  List<GastoCard> widgetCargas = [];
  ListaGastos({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    // userBloc.getMisGastosStream( DateTime(2022, 9, 2), DateTime.now(), "Transporte");
    return stack(context);
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
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
        Container(
          padding: EdgeInsets.only(top: 80, left: 100, right: 10.0),
          child: TitleHeader(title: "Mis gastos"),
        ),
        Container(
          padding: const EdgeInsets.only(top: 140),
          child: StreamBuilder(
            stream:
                userBloc.getMisGastos(DateTime(2022, 9, 2), DateTime.now(), ""),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  var docs = snapshot.data!.docs;
                  return ListView(
                    children: [
                      Text("""
      -> Falta implementar el filtro por categoria.
      -> agregar los controles para seleccionar fechas y
           categoria y el boton de buscar
      -> implementar opcion de exportar datos a excel
      -> implementar opcion para borrar un gasto
                        """),
                      ...listaGastoCards(docs)
                    ],
                  );
                case ConnectionState.done:
                  // print("Dentro de done");
                  // print(snapshot.data);
                  break;
                case ConnectionState.none:
                  return loading();
                case ConnectionState.waiting:
                  return loading();
              }
              // print(snapshot.data);
              return Center(child: Text("Ya estan listos los datos"));
            },
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.only(top: 140),
        //   child: ListView(padding: EdgeInsets.all(20), children: widgetCargas),
        // ),
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

  List<GastoCard> listaGastoCards(docs) {
    List<GastoCard> lista = <GastoCard>[];
    for (var gasto in docs) {
      DateTime fecha =
          DateTime.parse(gasto.data()["fecha"].toDate().toString());
      double importe = double.parse(gasto.data()["importe"].toString());
      GastoModel gasto_model = new GastoModel(
          concepto: gasto.data()["concepto"],
          descripcion: gasto.data()["descripcion"],
          fecha: fecha,
          importe: importe,
          categoria: gasto.data()["categoria"]);
      lista.add(new GastoCard(gasto_model));
    }
    return lista;
  }

  goToForm(BuildContext context) {
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
