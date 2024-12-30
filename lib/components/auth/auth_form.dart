import 'package:app_academia/components/auth/Button_sing_login.dart';
import 'package:app_academia/components/auth/breakRow.dart';
import 'package:app_academia/components/auth/forgot_password.dart';
import 'package:app_academia/components/auth/iconSingLogin.dart';
import 'package:app_academia/exception/authException.dart';
import 'package:app_academia/models/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sing_login_text.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _messageErro;

  String? _validatorUser(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo nome de usuário é obrigatório';
    }
    return null;
  }

  String? _validatorEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo e-mail é obrigatório';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Passe um e-mail válido';
    }
    return null;
  }

  String? _validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo senha é obrigatório';
    }
    if (value.length < 6) {
      return 'A senha tem  que ter no mínimo 6 digitos';
    }
    return null;
  }

  void _showMessageError(String message) {
    setState(() => _messageErro = message);
  }

  void _clearInputs() {
    _formkey.currentState?.reset();
    _emailController.clear();
    _passwordController.clear();
  }

  Future<void> _submitForm() async {
    final isValid = _formkey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _messageErro = null);
    setState(() => _isLoading = true);

    _formkey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    try {
      if (isLogin()) {
        await auth.login(_authData['email']!, _authData['password']!);
      } else {
        await auth.signup(_authData['email']!, _authData['password']!);
      }
    } on AuthException catch (error) {
      _showMessageError(error.toString());
    } catch (error) {
      _showMessageError('Ocorreu um erro inesperado!');
    }

    setState(() => _isLoading = false);
  }

  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    "user": '',
    "email": '',
    "password": '',
  };
  bool visibility = true;
  bool isLogin() => _authMode == AuthMode.Login;
  bool isSignup() => _authMode == AuthMode.Signup;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 100.0, left: 32.0, right: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLogin())
            SignLoginText('Entrar', 'Bem-vindo de volta! Insira seus dados.'),
          if (isSignup())
            SignLoginText(
                'Cadastra-se', 'Entre e descubra novas possibilidades.'),
          Form(
            key: _formkey,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  if (isSignup())
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: isSignup() ? _validatorUser : null,
                        onSaved: (user) => _authData['user'] = user ?? '',
                        decoration: InputDecoration(
                            labelText: 'Insira seu nome de usuário',
                            labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                                color: Color(0xff999999))),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      validator: isSignup() ? _validatorEmail : null,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (email) => _authData['email'] = email ?? '',
                      decoration: InputDecoration(
                          labelText: 'Insira seu e-mail',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Roboto',
                              color: Color(0xff999999))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: isSignup() ? _validatorPassword : null,
                      onSaved: (password) =>
                          _authData['password'] = password ?? '',
                      onFieldSubmitted: (_) => _submitForm(),
                      textInputAction: TextInputAction.done,
                      obscureText: visibility,
                      decoration: InputDecoration(
                          labelText: 'Insira sua senha',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Roboto',
                              color: Color(0xff999999)),
                          suffixIcon: IconButton(
                            icon: Icon(visibility
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                          )),
                    ),
                  ),
                  if (isLogin()) ForgotPassword(),
                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24.0),
              child: isLogin()
                  ? ButtonSingLogin("Entrar", _submitForm, _isLoading)
                  : ButtonSingLogin("Criar conta", _submitForm, _isLoading)),
          if (_messageErro != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _messageErro!,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Breakrow("OU"),
          ),
          Iconsinglogin(),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 40),
            child: RichText(
              text: TextSpan(
                  text: isLogin() ? "Não tem uma conta?" : "Já tem uma conta?",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      color: Color(0xff999999)),
                  children: [
                    TextSpan(
                        text: isLogin() ? " Cadastre-se" : " Faça login",
                        style: TextStyle(
                            color: Color(0xff1570EF),
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              if (isLogin()) {
                                _authMode = AuthMode.Signup;
                                _messageErro = null;
                                _clearInputs();
                              } else {
                                _authMode = AuthMode.Login;
                                _messageErro = null;
                                _clearInputs();
                              }
                            });
                          })
                  ]),
            ),
          )
        ],
      ),
    ));
  }
}
