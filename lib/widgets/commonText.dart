import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {Key? key,
      required this.text,
      this.color,
      this.size,
      this.weight,
      this.fontFamily})
      : super(key: key);
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: fontFamily,
      ),
    );
  }
}
