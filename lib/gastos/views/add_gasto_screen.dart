import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';

import 'package:mis_gastos/screens/card_image.dart';
import 'package:mis_gastos/screens/gradient_back.dart';

import 'package:mis_gastos/screens/widgets/button_color.dart';
import 'package:mis_gastos/screens/widgets/input_icon.dart';
import 'package:mis_gastos/screens/widgets/text_input.dart';
import 'package:mis_gastos/screens/widgets/title_header.dart';

class AddGastoScreen extends StatefulWidget {
  File? image;

  AddGastoScreen({Key? key, this.image}) : super(key: key);
  late UserBloc blocUser;
  @override
  State<AddGastoScreen> createState() => _AddGastoScreenState();
}

class _AddGastoScreenState extends State<AddGastoScreen> {
  @override
  DateTime dateTime = DateTime.now();
  late String categoria_tag = "Transporte";
  final items_categoria = [
    'Transporte',
    'Eventual',
    'Alimentacion',
    'Servicio',
    'Carro',
    'Otros gastos',
  ];

  File? imagen;
  final picker = ImagePicker();
  Future selImage(int opcion) async {
    print("botonazo a la camara");
    var pickedFile;
    if (opcion == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print("No seleccionaste ninguna foto");
      }
    });
  }

  Widget build(BuildContext context) {
    widget.blocUser = BlocProvider.of(context);

    final hours = dateTime.hour.toString().padLeft(2, "0");
    final minute = dateTime.minute.toString().padLeft(2, "0");

    final _controllerConcepto = TextEditingController();
    final _controllerDescripcion = TextEditingController();
    TextEditingController _controllerImporte = TextEditingController();
    final _controllerFoto = TextEditingController();
    final _controllerUbicacion = TextEditingController();

    void guardarGasto(GastoModel gasto, BuildContext context) {
      // print(gasto.toMap());

      //1. guardar la imagehn si existe al firestore

      //2. CloudFirestore se guarda los datos del gasto
      // este funciona !!
      // widget.blocUser
      //     .updateGastoData(gasto)
      //     .whenComplete(() => Navigator.pop(context));

      selImage(1);
    }

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));

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
            height: 250,
            color1: "#F19494",
            color2: "#E76868",
          ),
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
                child: TitleHeader(title: "Nuevo gastos"),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.topCenter,
            child: CardImage(
                height: 350,
                width: 250,
                iconData: Icons.camera,
                pathImage: widget.image?.path,
                onPressed: () => print("botonazoo")),
          ),
          Container(
            margin: EdgeInsets.only(top: 400, bottom: 20),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 30),
                  child: TextInput(
                      hintText: "Concepto",
                      inputType: TextInputType.text,
                      maxLine: 1,
                      controller: _controllerConcepto),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextInput(
                      hintText: "Descripción",
                      inputType: TextInputType.multiline,
                      maxLine: 2,
                      controller: _controllerDescripcion),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextInput(
                      hintText: "Importe",
                      inputType: TextInputType.number,
                      maxLine: 1,
                      controller: _controllerImporte),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items_categoria
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: categoria_tag,
                      onChanged: (value) {
                        categoria_tag = value as String;
                        // setState(() => categoria_tag = value as String);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.redAccent,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 255, 123, 123),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: InputIcon(
                      controller: _controllerUbicacion,
                      hintText: "Ubicación",
                      inputType: TextInputType.text,
                      iconData: Icons.location_on,
                    )),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: ButtonColor(
                      width: 1,
                      height: 50,
                      text: "Registrar Gasto",
                      color1: "#F19494",
                      color2: "#E76868",
                      onPressed: () => guardarGasto(
                          GastoModel(
                              concepto: _controllerConcepto.value.text,
                              descripcion: _controllerDescripcion.value.text,
                              fecha: dateTime,
                              importe:
                                  double.parse(_controllerImporte.value.text),
                              categoria: categoria_tag),
                          context),
                      textColor: "#FFFFFF"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
