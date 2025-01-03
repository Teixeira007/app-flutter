import 'package:app_academia/models/auth.dart';
import 'package:app_academia/pages/auth_page.dart';
import 'package:app_academia/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOrHomepage extends StatelessWidget {
  const AuthOrHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? HomePage() : AuthPage();
  }
}