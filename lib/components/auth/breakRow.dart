import 'package:flutter/material.dart';

class Breakrow extends StatelessWidget {
  final String texto;

  Breakrow(this.texto);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 1,
          color: Color(0xff999999),
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '$texto',
            style: TextStyle(fontSize: 16.0, color: Color(0xff999999)),
          ),
        ),
        Expanded(
            child: Divider(
          thickness: 1,
          color: Color(0xff999999),
        )),
      ],
    );
  }
}
