import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/ingresos/model/ingreso_model.dart';
import 'package:mis_gastos/screens/gradient_back.dart';
import 'package:mis_gastos/screens/widgets/button_color.dart';
import 'package:mis_gastos/screens/widgets/title_header.dart';

class IngresoForm extends StatefulWidget {
  const IngresoForm({Key? key}) : super(key: key);

  @override
  State<IngresoForm> createState() => _IngresoFormState();
}

class _IngresoFormState extends State<IngresoForm> {
  late UserBloc blocUser;
  final key = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();

  late TextEditingController conceptoController = TextEditingController();
  late String concepto;

  late TextEditingController ingresoController = TextEditingController();
  late double ingreso;

  late TextEditingController observacionesController = TextEditingController();
  late String observaciones;

  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of(context);
    final hours = dateTime.hour.toString().padLeft(2, "0");
    final minute = dateTime.minute.toString().padLeft(2, "0");
    Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2100));
    Future<TimeOfDay?> pickTime() =>
        showTimePicker(context: context, initialTime: TimeOfDay.now());
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(
            title: "",
            height: 190,
            color1: "#F19494",
            color2: "#E76868",
          ),
          Container(
              height: 130,
              margin: EdgeInsets.only(top: 45, left: 250),
              child: Image.asset("assets/img/nuevo_ingreso.png")),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25, left: 5),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                  child: Container(
                padding: EdgeInsets.only(top: 40, left: 20, right: 10.0),
                child: TitleHeader(title: "Nuevo ingreso"),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 180, left: 10, right: 10),
            child: ListView(children: [
              Form(
                  key: key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: conceptoController,
                        decoration: InputDecoration(labelText: "Contepto"),
                        onSaved: (val) {
                          concepto = val!;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "El concepto es requerido";
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      final date = await pickDate();
                                      if (date == null) return;
                                      dateTime = date;
                                    },
                                    child: Text(
                                        '${dateTime.day}/ ${dateTime.month}/${dateTime.year}'))),
                            SizedBox(width: 12),
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      final time = await pickTime();
                                      if (time == null) return;
                                      final newDateTime = DateTime(
                                          dateTime.year,
                                          dateTime.month,
                                          dateTime.day,
                                          time.hour,
                                          time.minute);
                                      dateTime = newDateTime;
                                    },
                                    child: Text('$hours: $minute'))),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: ingresoController,
                        decoration: InputDecoration(labelText: "Importe"),
                        keyboardType: TextInputType.number,
                        onSaved: (val) {
                          ingreso = double.parse(val!);
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "El importe es requerido";
                          }
                        },
                      ),
                      TextFormField(
                          controller: observacionesController,
                          keyboardType: TextInputType.multiline,
                          decoration:
                              InputDecoration(labelText: "Observaciones"),
                          onSaved: (val) {
                            observaciones = val!;
                          }),
                      ButtonColor(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          text: "Guardar",
                          color1: "#CACACACA",
                          color2: "#BFBFBFBF",
                          onPressed: () {
                            print("botonazo");
                            if (key.currentState!.validate()) {
                              key.currentState!.save();
                              var ingresoModel = new IngresoModel(
                                concepto: concepto,
                                fecha: dateTime,
                                importe: ingreso,
                                observaciones: "observaciones",
                              );
                              blocUser
                                  .nuevoIngreso(ingresoModel)
                                  .whenComplete(() => Navigator.pop(context));
                              print(ingresoModel.toMap());
                            }
                          },
                          textColor: "#000000")
                    ],
                  )),
            ]),
          )
        ],
      ),
    );
  }

  void _goToSavedPage() {}
}
