import 'package:flutter/material.dart';

class Iconsinglogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0x95999999), width: 1)),
          child: IconButton(
            onPressed: () => {},
            icon: Image.asset('assets/GoogleLogo.png', width: 30, height: 30),
          ),
        ),
        SizedBox(width: 10),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0x95999999), width: 1)),
          child: IconButton(
            onPressed: () => {},
            icon: Image.asset('assets/AppleLogo.png', width: 30, height: 30),
          ),
        ),
      ],
    );
  }
}
