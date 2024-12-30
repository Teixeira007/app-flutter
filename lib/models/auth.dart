import 'dart:convert';

import 'package:app_academia/exception/authException.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  

  Future<void> _authenticate(String email, String password, String urlFragment) async {
    final _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyANtyFLlQjjfufkIYeKZRUcFB9Y3WnPcZA';
    
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    final body = jsonDecode(response.body);

    if(body['error'] != null){
      throw AuthException(body['error']['message']);
    }

    print(body);
  }


  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
