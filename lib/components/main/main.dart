import 'package:app_academia/models/auth.dart';
import 'package:app_academia/pages/auth_page.dart';
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
        ChangeNotifierProvider(create: (_) => Auth())
      ],
      child: MaterialApp(
        initialRoute: AppRoutes.AUTH,
        routes: {
          AppRoutes.AUTH:  (context) => AuthPage()
        },
        ),
    );
  }
}
