// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'package:mis_gastos/ingresos/model/ingreso_model.dart';

// ignore: must_be_immutable
class IngresoCard extends StatelessWidget {
  late IngresoModel model;
  IngresoCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  // IngresoCard(this.fecha, this.concepto, this.cantidad, this.id, {Key? key})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getSlidable(ingresoCard());

    // return ingresoCard();
  }

  Card ingresoCard() {
    final numberFormat = NumberFormat("##,##0.00", "en_US");
    var detalle = Container(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  Jiffy(this.model.fecha).yMMMdjm,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(" "),
              Flexible(
                child: Text(
                  model.concepto,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Text(model.observaciones)
        ],
      ),
    );
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: const FractionalOffset(1.0, 0.0),
                  child: const Text("\$",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Lato",
                          color: Colors.black38)),
                ),
                Text(
                  numberFormat.format(this.model.importe),
                  style: const TextStyle(
                      fontSize: 35.0, fontFamily: "Lato", color: Colors.black),
                ),
              ],
            ),
          ),
          detalle
        ],
      ),
    );
  }

  Widget getSlidable(Widget card) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: const [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: card,
      // child: const ListTile(title: Text('Slide me')),
    );
  }

  bool onDelete() {
    return false;
  }
}
