import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Esqueceu a senha?',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff1570EF),
              fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
