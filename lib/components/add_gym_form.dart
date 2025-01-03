import 'dart:io';

import 'package:app_academia/components/image_location.dart';
import 'package:app_academia/components/input_location.dart';
import 'package:app_academia/providers/great_gym.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddGymForm extends StatefulWidget {
  const AddGymForm({super.key});

  @override
  State<AddGymForm> createState() => _AddGymFormState();
}

class _AddGymFormState extends State<AddGymForm> {
  final TextEditingController _titleController = TextEditingController();
  File? _pickedImage;

  void _onSelectImage(File imageSelectd) {
    _pickedImage = imageSelectd;
  }

  void _submit() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatGym>(context, listen: false).addGym(
      _titleController.text,
      _pickedImage!,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin:
                    EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                        labelText: 'Nome da academia',
                        labelStyle: TextStyle(color: Color(0xff999999))),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: ImageLocation(this._onSelectImage))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: InputLocation())),
            ],
          ),
        )),
         Positioned(
            bottom: 60,
            right: 20,
            child: FloatingActionButton(
              onPressed: _submit,
              backgroundColor: Colors.blue,
              child: Icon(Icons.save, color: Colors.white,),
            ),
          ),
      ],
    );
  }
}
