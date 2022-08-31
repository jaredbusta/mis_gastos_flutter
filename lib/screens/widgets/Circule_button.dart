import 'package:flutter/material.dart';

class CirculeButton extends StatefulWidget {
  final VoidCallback onPressed;
  bool mini;
  var icon;
  double iconSize;
  int color;
  int iconColor;

  CirculeButton(this.mini, this.icon, this.iconSize, this.color,
      {Key? key, required this.onPressed, required this.iconColor})
      : super(key: key);

  @override
  State<CirculeButton> createState() => _CirculeButtonState();
}

class _CirculeButtonState extends State<CirculeButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: Color(widget.color),
      mini: widget.mini,
      onPressed: widget.onPressed,
      child: Icon(widget.icon,
          size: widget.iconSize, color: Color(widget.iconColor)),
      heroTag: null,
    ));
  }
}
