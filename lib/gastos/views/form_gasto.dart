import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/screens/gradient_back.dart';
import 'package:mis_gastos/screens/widgets/button_color.dart';
import 'package:mis_gastos/screens/widgets/text_form_field_custom.dart';
import 'package:mis_gastos/screens/widgets/title_header.dart';

class FormGasto extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final _conceptoController = TextEditingController();
  final _descripcionController = TextEditingController();

  final _importeController = TextEditingController();

  late UserBloc blocUser;

  DateTime dateTime = DateTime.now();
  final picker = ImagePicker();
  FormGasto({Key? key}) : super(key: key);
  String categoria_tag = "Transporte";
  final items_categoria = [
    'Transporte',
    'Eventual',
    'Alimentacion',
    'Servicio',
    'Carro',
    'Otros gastos',
  ];

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
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 3,
        height: MediaQuery.of(context).size.height * 3,
        child: ListView(
          children: [
            Form(
              key: _key,
              child: Column(
                children: [
                  Stack(
                    children: [
                      GradientBack(
                        title: "",
                        height: 50,
                        color1: "#F19494",
                        color2: "#E76868",
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 10, left: 20, right: 10.0),
                        child: TitleHeader(title: "Nuevo gasto"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldCustom(
                      hintText: "Concepto",
                      inputType: TextInputType.text,
                      controller: _conceptoController),
                  const SizedBox(height: 10),
                  TextFormFieldCustom(
                      hintText: "Descripcion",
                      inputType: TextInputType.text,
                      maxLine: 2,
                      controller: _descripcionController),
                  const SizedBox(height: 10),
                  DropdownButtonHideUnderline(
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
                        (context as Element).markNeedsBuild();
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  TextFormFieldCustom(
                      hintText: "Importe",
                      inputType: TextInputType.number,
                      controller: _importeController),
                  const SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: ButtonColor(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        text: "Registrar Gasto",
                        color1: "#F19494",
                        color2: "#E76868",
                        onPressed: () => guardarGasto(
                            GastoModel(
                                concepto: _conceptoController.value.text,
                                descripcion: _descripcionController.value.text,
                                fecha: dateTime,
                                importe:
                                    double.parse(_importeController.value.text),
                                categoria: categoria_tag),
                            context),
                        textColor: "#FFFFFF"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void guardarGasto(GastoModel gasto, BuildContext context) {
    print(gasto.toMap());

    //2. CloudFirestore se guarda los datos del gasto
    blocUser.updateGastoData(gasto).whenComplete(() => Navigator.pop(context));
  }
}
