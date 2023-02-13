import 'package:flutter/material.dart';
import 'package:primeiro_app/shared/constants/custom_colors.dart';

Drawer getHomeDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: CustomColors().getAppBarMainColor(),
          ),
          accountEmail: Text("felipe@gmail.com"),
          accountName: Text("Felipe"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "FS",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: CustomColors().getAppBarMainColor(),
          ),
          title: Text(
            "Configurações",
            style: TextStyle(
              color: CustomColors().getAppBarMainColor(),
            ),
          ),
        ),
         ListTile(
          leading: Icon(
            Icons. arrow_back_sharp,
            color: CustomColors().getAppBarMainColor(),
          ),
          title: Text(
            "Sair",
            style: TextStyle(
              color: CustomColors().getAppBarMainColor(),
            ),
          ),
        ),
      ],
    ),
  );
}
