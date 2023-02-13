import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:primeiro_app/pages/login/login_service.dart';
import 'package:primeiro_app/pages/sign_up/sign_up_page.dart';
import 'package:primeiro_app/shared/models/Login_model.dart';
import 'package:primeiro_app/shared/constants/custom_colors.dart';
import 'package:primeiro_app/shared/constants/preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword =true;
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ 
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSecColor()
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: 15, top: 20),
                child: Image.asset(
                  "assets/dumbbell.png",
                  height: 125,
                ),
              ),
              Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 5 || !value.contains('@'))  {
                            return 'Email está inválido';
                            }
                           return null;
                        },
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      obscureText: _obscurePassword,
                       validator: (value) {
                          if (value == null || value.isEmpty  ) {
                            return 'Nome está inválido';
                            }else if(value.length < 6){
                              return 'A senha deve ter no minímo 6 caracteres';
                            }
                           return null;
                        },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              GestureDetector(
                child: Text(
                  "Esqueceu a senha?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                onTap: () {
                  print("Funcionou");
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: this._obscurePassword,
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          this._obscurePassword = value;
                          print(this._obscurePassword);
                        }
                      });
                    },
                  ),
                  Text(
                    "Mostrar a senha?",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _doLogin();
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        CustomColors().getActivePrimaryButtonColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                "Ainda não tem uma conta?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors().getActiveSeconderyButton(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
   if( _formKey.currentState!.validate()){
    LoginService().login(_emailInputController.text, _passwordInputController.text);
   }else{
    print("inválido!");
   }
  }

  Future<LoginModel?> _getSavedUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? jsonUser = preferences.getString(PreferencesKey.activeUser);
    print(jsonUser);
    if (jsonUser != null) {
      Map<String, dynamic> mapUser = json.decode(jsonUser);
      LoginModel user = LoginModel.fromJson(mapUser);
      return user;
    }
  }
}
