import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/gastos/views/form_gasto.dart';
import 'package:mis_gastos/gastos/views/importa_csv_gastos.dart';
import 'package:mis_gastos/gastos/widget/gasto_card_resumen.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/screens/widgets/title_header.dart';
import 'package:mis_gastos/utils/util.dart';
import '../widget/gasto_card.dart';
import '../../screens/gradient_back.dart';

class ListaGastos extends StatefulWidget {
  ListaGastos({Key? key}) : super(key: key);

  @override
  State<ListaGastos> createState() => _ListaGastosState();
}

class _ListaGastosState extends State<ListaGastos> {
  late UserBloc userBloc;
  late double total_gastos = 0;
  late DateTime start;
  late DateTime end;

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    start = DateTime(now.year, now.month, 1);
    end = DateTime(now.year, now.month + 1, 0, 23, 59, 59, 999);
  }

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

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100));

  stack(BuildContext context) {
    List<GastoCard> listaGastosCards;
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
            height: 130,
            margin: EdgeInsets.only(top: 15, left: 230),
            child: Image.asset("assets/img/gastos.png")),
        Container(
          padding: EdgeInsets.only(top: 70, left: 40, right: 10.0),
          child: TitleHeader(title: "Mis Egresos"),
        ),
        searchForm(),
        Container(
          padding: const EdgeInsets.only(top: 140),
          child: StreamBuilder(
            stream: userBloc.getMisGastos(start, end, "Transporte"),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  var docs = snapshot.data!.docs;
                  total_gastos = 0;
                  listaGastosCards = listaGastoCards(docs);
                  return ListView(
                    children: [
                      Text("""
      -> Falta implementar el filtro por categoría.
      -> agregar los controles para seleccionar fechas y
           categoria y el boton de buscar
      -> implementar opcion de exportar datos a excel
      -> implementar opcion para borrar un gasto
                        """),
                      GastoCardResumen(
                          total_gasto: total_gastos,
                          cantidad_items: docs.length),
                      ...listaGastoCards(docs)
                    ],
                  );
                case ConnectionState.done:
                  break;
                case ConnectionState.none:
                  return loading();
                case ConnectionState.waiting:
                  return loading();
              }
              return Center(child: Text("Ya estan listos los datos"));
            },
          ),
        ),
        Container(
          alignment: Alignment(0.9, -0.68),
          child: SizedBox(
              width: 50,
              height: 50,
              child: CirculeButton(
                  false, Icons.upload_file, 32, Util.color("#FFFFFF"),
                  onPressed: () => {goToImportaCSV(context)},
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

      total_gastos += importe;
    }
    return lista;
  }

  Widget searchForm() {
    return Container(
      margin: EdgeInsets.only(top: 110),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              final date = await pickDate();
              if (date == null) return;
              setState(() {
                start = date;
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 0, left: 20, bottom: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                Jiffy(start).MMMEd,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final date = await pickDate();
              if (date == null) return;
              setState(() {
                var newEnd =
                    DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
                end = newEnd;
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 0, bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                Jiffy(end).MMMEd,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
            ),
          )
        ],
      ),
    );
  }

  goToForm(BuildContext context) {
    showDialog(context: context, builder: (context) => FormGasto());
  }

  goToImportaCSV(BuildContext context) {
    // setState(() {
    //   start = DateTime(2022, 8, 1);
    //   end = DateTime(2022, 8, 31, 23, 59, 59);
    // });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ImportaCSVGastos()));
  }
}
