import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class InputLocation extends StatefulWidget {
  const InputLocation({super.key});

  @override
  State<InputLocation> createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Localização',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff999999),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor:  Color(0xff1570EF),
                side: BorderSide(color: Color(0xff1570EF)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                minimumSize: Size(double.infinity, 20)),
            icon: Icon(
              Icons.location_on,
              size: 25,
              color: Color(0xffffffff),
            ),
            onPressed: () => {},
            label: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Usar localização atual',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffffffff),
                    fontFamily: 'Roboto'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                side: BorderSide(color: Color(0xff1570EF)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                minimumSize: Size(double.infinity, 20)),
            icon: Icon(
              Icons.add,
              size: 25,
              color: Color(0xff1570EF),
            ),
            onPressed: () => {},
            label: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Adicionar endereço',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff1570EF),
                    fontFamily: 'Roboto'),
              ),
            ),
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
                child:  Icon(Icons.map_outlined,
                        size: 60, // Tamanho do ícone
                        color: Color(0xff999999)),
              )),
        ],
      ),
    );
  }
}
