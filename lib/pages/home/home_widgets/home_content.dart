import 'package:flutter/material.dart';

import 'package:primeiro_app/pages/home/home_widgets/home_list_item.dart';
import 'package:primeiro_app/pages/home/home_widgets/home_list_model.dart';
import 'package:primeiro_app/shared/constants/custom_colors.dart';

class HomePageContent extends StatefulWidget {
  List<HomeListModel> listModels;
HomePageContent({ required this.listModels});
  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      child: ListView.builder(
        itemCount: widget.listModels.length,
        itemBuilder: (context, index) {
          return HomeListItem(
            homeListModel: widget.listModels[index],
          );
        },
      ),
    );
  }
}
