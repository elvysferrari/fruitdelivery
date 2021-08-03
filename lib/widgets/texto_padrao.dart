import 'package:flutter/material.dart';

class TextoPadrao extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const TextoPadrao({Key? key, this.text, this.size, this.color, this.weight}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: size ?? 16, color: color ?? Colors.black, fontWeight: weight ?? FontWeight.normal, ),
    );
  }
}
