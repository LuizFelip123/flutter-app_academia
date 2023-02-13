import 'package:flutter/material.dart';

import 'package:primeiro_app/pages/home/home_widgets/home_appbar.dart';
import 'package:primeiro_app/pages/home/home_widgets/home_content.dart';
import 'package:primeiro_app/pages/home/home_widgets/home_drawer.dart';
import 'package:primeiro_app/pages/home/home_widgets/home_fab.dart';
import 'package:primeiro_app/pages/home/home_widgets/home_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<HomeListModel> listModels = [
    HomeListModel(title: "Academia -o club", assetIcon: "assets/icons/gym.png"),
    HomeListModel(title: "Academia nineFit", assetIcon: "assets/icons/gym.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(),
      floatingActionButton: getHomeFab(context, listModels, refreshPage),
      body: HomePageContent(listModels: listModels, ),
    );
  }
  refreshPage(){
    setState(() {
        listModels;

    });
  }
}
