import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Gym App"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              i = i + 1;
            });
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Container(
            child: Text(
              i.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 72),
            ),
          ),
        ));
  }
}

//LISTA DE WIDGET APRENDIDOS
//Container
// child é um filho, ou seja, algo que está dentro do conteiner
//Text
//scaffold Cria um padrão para telas
//icon
//FloatingActionButton
//Center