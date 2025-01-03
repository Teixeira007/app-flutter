import 'package:app_academia/components/add_gym_form.dart';
import 'package:flutter/material.dart';

class AddGymPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Academia'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddGymForm(),
          ],
        ),
      ),
    );
  }
}
