import 'package:flutter/material.dart';
import 'package:mis_gastos/utils/util.dart';

class GastosAppBar extends StatelessWidget {
  const GastosAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(Util.color("#F75454")),
                Color(Util.color("#E33131")),
              ],
              begin: const FractionalOffset(0.2, 0.0),
              end: const FractionalOffset(1.0, 0.6),
              stops: const [0.0, 0.6],
              tileMode: TileMode.clamp)),
      alignment: const Alignment(-0.9, -0.6),
      child: const Text(
        "Mis gastos",
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
// Container(
//             alignment: Alignment(0, 0),
//             child: CirculeButton(false, Icons.add, 32, Util.color("#FFFFFF"),
//                 onPressed: () => {}, iconColor: Util.color("#000000"))),