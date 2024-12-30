import 'package:flutter/material.dart';

class SignLoginText extends StatelessWidget {
  final String title;
  final String sub_title;
  SignLoginText(this.title, this.sub_title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(
            fontSize: 35.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$sub_title",
          style: TextStyle(
            fontSize: 15.0,
            color: Color(0xFF999999),
          ),
        )
      ],
    );
  }
}
