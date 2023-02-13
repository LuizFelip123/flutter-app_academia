import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:primeiro_app/shared/constants/routes.dart';
class LoginService{
  login(String email, String password) async{
        http.Response response = await http.post(
      Uri.parse(Route.urlLogin),
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken":true
        },
      ),
    );
    print(response.body);
  }
  
}