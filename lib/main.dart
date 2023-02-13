import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/home/home_page.dart';
import 'package:primeiro_app/pages/login/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home:  LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
