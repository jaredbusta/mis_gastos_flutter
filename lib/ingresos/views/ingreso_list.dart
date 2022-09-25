import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/ingresos/model/ingreso_model.dart';
import 'package:mis_gastos/ingresos/widgets/ingreso_card_resumen.dart';
import 'package:mis_gastos/screens/gradient_back.dart';

import 'package:mis_gastos/screens/widgets/title_header.dart';

import '../widgets/ingreso_card.dart';

class IngresoList extends StatelessWidget {
  late UserBloc userBloc;
  late double total_ingresos = 0;
  IngresoList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.getMisGastos(DateTime(2022, 9, 1), DateTime.now(), "");
    List<IngresoCard> listaIngresosCards;
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
        child: StreamBuilder(
          stream: userBloc.getMisIngresos(DateTime(2022, 1, 1), DateTime.now()),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                var docs = snapshot.data!.docs;
                total_ingresos = 0;
                listaIngresosCards = getListaIngresosCards(docs);
                return ListView(
                  children: [
                    Text("""
      -> implementar opcion de exportar datos a excel
      -> implementar opcion para borrar un ingreso
                        """),
                    IngresoCardResumen(
                        total_gasto: total_ingresos,
                        cantidad_items: docs.length),
                    ...listaIngresosCards
                  ],
                );
              case ConnectionState.done:
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
      )
    ]);
  }

  List<IngresoCard> getListaIngresosCards(docs) {
    List<IngresoCard> lista = <IngresoCard>[];
    for (var ingreso in docs) {
      DateTime fecha =
          DateTime.parse(ingreso.data()["fecha"].toDate().toString());
      double importe = double.parse(ingreso.data()["importe"].toString());
      //  ingreso.data()["concepto"]
      // this.fecha, this.concepto, this.cantidad, this.id
      IngresoModel model = IngresoModel(
          concepto: ingreso.data()["concepto"],
          fecha: fecha,
          importe: importe,
          observaciones: ingreso.data()["observaciones"]);
      IngresoCard ingreso_card = IngresoCard(model: model);
      lista.add(ingreso_card);

      total_ingresos += importe;
    }
    return lista;
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
