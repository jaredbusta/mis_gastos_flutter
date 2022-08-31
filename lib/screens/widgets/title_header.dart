import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  const TitleHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold)),
    );
  }
}
