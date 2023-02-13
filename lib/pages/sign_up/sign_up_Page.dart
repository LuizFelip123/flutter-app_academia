import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/sign_up/sign_up_service.dart';
import 'package:primeiro_app/shared/models/Login_model.dart';
import 'package:primeiro_app/shared/constants/custom_colors.dart';
import 'package:primeiro_app/shared/constants/preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPassword = false;
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomColors().getActivePrimaryButtonColor(),
                CustomColors().getGradientMainColor()
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Cadastro",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
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
                          if (value == null || value.isEmpty) {
                            return 'Nome está inválido';
                            }
                           return null;
                        },
                    ),
                    TextFormField(
                      controller: _emailInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email,
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
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
                      obscureText: (this._showPassword == true) ? false : true,
                       validator: (value) {
                          if (value == null || value.isEmpty  ) {
                            return 'Nome está inválido';
                            }else if(value.length < 6){
                              return 'A senha deve ter no minímo 6 caracteres';
                            }
                           return null;
                        },
                    ),
                    (this._showPassword == false)
                        ? TextFormField(
                            controller: _confirmInputController,
                            autofocus: true,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              labelText: "Confimar Senha",
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
                            obscureText: true,
                          )
                        : Container(),
                    Row(
                      children: [
                        Checkbox(
                            value: _showPassword,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  _showPassword = value;
                                }
                              });
                            }),
                        Text(
                          "Mostrar senha",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  _doSignUp();
                 
                },
                child: Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors().getActiveSeconderyButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doSignUp() {
    
    //LoginModel newUser = LoginModel(
    //  name: _nameInputController.text,
    //  email: _emailInputController.text,
    //  password: _passwordInputController.text,
    //  connect: true,
    //);
    //_saveUser(newUser);
    if(_formKey.currentState!.validate()){
      SignUpService().signUp(_emailInputController.text, _passwordInputController.text);
       Navigator.pop(context);
    }else{
      print("inválido = ${_formKey.currentState!.validate()}");
    }
  }

  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKey.activeUser,
      json.encode(
        user.toJson(),
      ), 
    );
  }
}
