import 'package:flutter/material.dart';
import 'package:mis_gastos/gastos/widget/gasto.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/screens/widgets/title_header.dart';
import 'package:mis_gastos/utils/util.dart';
import '../../screens/gradient_back.dart';

class ImportaCSVGastos extends StatelessWidget {
  const ImportaCSVGastos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(
              title: "", height: 180, color1: "#F75454", color2: "#E33131"),
          Row(children: [
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
              child: TitleHeader(title: "Importar CSV de gastos"),
            )),
          ]),
          Container(
            padding: const EdgeInsets.only(top: 140),
            child: ListView(
              children: [
                Gasto("9.00", "01 ago", "camioncito "),
              ],
            ),
          ),
          Container(
            alignment: Alignment(0.9, -0.64),
            child: SizedBox(
                width: 50,
                height: 50,
                child: CirculeButton(
                    false, Icons.file_open, 32, Util.color("#FFFFFF"),
                    onPressed: () => {}, iconColor: Util.color("#000000"))),
          ),
        ],
      ),
    );
  }
}
