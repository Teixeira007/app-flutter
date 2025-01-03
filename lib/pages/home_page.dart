import 'package:app_academia/components/main/bottom_navigation.dart';
import 'package:app_academia/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 35, right: 35, top: 60, bottom: 0),
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Color(0x90ffffff)),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              icon: Icon(
                Icons.add_location_alt,
                size: 25,
                color: Color(0xff1570EF),
              ),
              onPressed: () =>
                  {Navigator.pushNamed(context, AppRoutes.ADD_GYM)},
              label: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Adicionar Academia',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff1570EF),
                      fontFamily: 'Roboto'),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
