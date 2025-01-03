import 'package:app_academia/models/auth.dart';
import 'package:app_academia/pages/add_gym_page.dart';
import 'package:app_academia/pages/auth_or_homepage.dart';
import 'package:app_academia/providers/great_gym.dart';
import 'package:app_academia/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(new AcademiaApp());
}

class AcademiaApp extends StatefulWidget {
  @override
  State<AcademiaApp> createState() => _AcademiaApp();
}

class _AcademiaApp extends State<AcademiaApp> {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => GreatGym())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xff1570EF),
          secondaryHeaderColor: Color(0xff999999),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff1570EF),
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white, // Cor da seta de voltar
          ),
          // primaryColor: Color(0xff1570EF),
        ),
        initialRoute: AppRoutes.AUTH_OR_HOME,
        routes: {
          AppRoutes.AUTH_OR_HOME: (context) => AuthOrHomepage(),
          AppRoutes.ADD_GYM: (context) => AddGymPage(),
        },
      ),
    );
  }
}
