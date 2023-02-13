import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/home/home_widgets/home_list_model.dart';
import 'package:primeiro_app/pages/home/home_widgets/home_modal_add.dart';

FloatingActionButton getHomeFab(
    BuildContext context, List<HomeListModel> listModels, Function fnc) {
  return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (context) => HomeModalAdd(
          listModels: listModels,
          fncRefresh: fnc,
        ),
      );
    },
    child: Text(
      '+',
      style: TextStyle(
        fontSize: 24,
      ),
    ),
  );
}
