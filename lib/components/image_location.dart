import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageLocation extends StatefulWidget {
  final Function onSelectImage;

  ImageLocation(this.onSelectImage);

  @override
  State<ImageLocation> createState() => _ImageLocationState();
}

class _ImageLocationState extends State<ImageLocation> {
  File? _storageImage;

  _takePicture() async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile _imageFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      _storageImage = File(_imageFile.path);
    });

    final appDir = await getApplicationDocumentsDirectory();
    String fileName = basename(_storageImage!.path);
    final savedImage = await _storageImage!.copy(
      '${appDir.path}/$fileName',
    );
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Imagem',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff999999),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          DottedBorder(
              color: Color(0xff1570EF),
              strokeWidth: 2,
              dashPattern: [4, 6],
              borderType: BorderType.RRect,
              radius: Radius.circular(3),
              child: Container(
                width: double.infinity,
                height: 180,
                child: _storageImage != null
                    ? Image.file(
                        _storageImage!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.image_outlined,
                        size: 60, // Tamanho do ícone
                        color: Color(0xff999999)),
              )),
          SizedBox(
            height: 10,
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              side: BorderSide(color: Color(0xff1570EF)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
                  minimumSize: Size(double.infinity, 20)
            ),
            icon: Icon(
              Icons.add_a_photo,
              size: 25,
              color: Color(0xff1570EF),
            ),
            onPressed: _takePicture,
            label: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Adicionar Imagem',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff1570EF),
                    fontFamily: 'Roboto'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
