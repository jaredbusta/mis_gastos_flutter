import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IngresoForm extends StatefulWidget {
  const IngresoForm({Key? key}) : super(key: key);

  @override
  State<IngresoForm> createState() => _IngresoFormState();
}

class _IngresoFormState extends State<IngresoForm> {
  String fecha = "";
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Fecha"),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "concepto"),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "tipo"),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "importe"),
          ),
          Row(
            children: [
              RaisedButton(
                onPressed: _goToSavedPage,
                child: const Text("Guardar"),
              ),
              RaisedButton(
                onPressed: _goToSavedPage,
                child: const Text("Cancelar"),
              )
            ],
          )
        ],
      ),
    ));
  }

  void _goToSavedPage() {}
}
