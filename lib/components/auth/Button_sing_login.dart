import 'package:flutter/material.dart';

class ButtonSingLogin extends StatelessWidget {
  final String texto;
  final  void Function() onClick;
  final bool isLoading;

  ButtonSingLogin(this.texto, this.onClick, this.isLoading);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: isLoading ? null : onClick,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '$texto',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1570EF),
                  foregroundColor: Colors.white)),
        )
      ],
    );
  }
}
