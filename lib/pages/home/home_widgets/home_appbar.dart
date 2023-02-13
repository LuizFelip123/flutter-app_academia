import 'package:flutter/material.dart';
import 'package:primeiro_app/shared/constants/custom_colors.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: Text("Minhas Academias"),
    centerTitle: true,
    backgroundColor: CustomColors().getAppBarMainColor(),
    actions: [
      IconButton(
        icon: Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
          
        ),
        onPressed: (){
          
        },
      ),
    ],
  );
}
