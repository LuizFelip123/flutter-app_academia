import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:primeiro_app/pages/home/home_widgets/home_list_model.dart';

class HomeModalAdd extends StatefulWidget {
  List<HomeListModel> listModels;
  Function fncRefresh;
  HomeModalAdd({required this.listModels, required this.fncRefresh});

  @override
  State<HomeModalAdd> createState() => _HomeModalAddState();
}

class _HomeModalAddState extends State<HomeModalAdd> {
  TextEditingController _nameInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 30,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Criar Academia",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _nameInputController,
                decoration:
                    InputDecoration(labelText: "Qual é o nome da academia?"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  _criarModel();
                },
                child: Text("Criar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _criarModel(){
  HomeListModel hlm = HomeListModel(title: _nameInputController.text, assetIcon: "assets/icons/gym.png");

   setState(() {
    widget.listModels.add(hlm);
   });
   widget.fncRefresh();
   Navigator.pop(context);
  }
}
