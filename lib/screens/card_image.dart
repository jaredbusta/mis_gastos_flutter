import 'package:flutter/material.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/utils/util.dart';

class CardImage extends StatelessWidget {
  final double width;
  final double height;
  double? left = 20;
  final String? pathImage;
  final VoidCallback onPressed;
  final IconData iconData;

  CardImage(
      {Key? key,
      required this.pathImage,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.iconData,
      this.left})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(top: 80.0, left: 20.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage("assets/img/la_siesta.jpg")),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: Alignment(0.5, 1.1),
      children: [
        card,
        CirculeButton(false, Icons.camera, 32, Util.color("#FFFFFF"),
            onPressed: onPressed, iconColor: Util.color("#000000"))
      ],
    );
  }
}
