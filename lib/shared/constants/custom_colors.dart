import 'package:flutter/material.dart';


class CustomColors{
  Color _activePrimaryButton  = Color.fromARGB(255, 63, 81, 181);
  Color _activeSeconderyButton = Color.fromARGB(255, 230, 220, 245);
  Color _gradientMainColor = Colors.blue;
  Color _gradientSecColor = Color.fromARGB(255, 212, 247, 255);
  Color _appBarMainColor  = Color(0xff0A6D92);
  Color getActivePrimaryButtonColor(){
    return _activePrimaryButton;
  }
  Color getActiveSeconderyButton(){
    return _activeSeconderyButton;
  }
  Color getGradientMainColor(){
    return _gradientMainColor;
  }
  Color getGradientSecColor(){
    return _gradientSecColor;
  }
  Color getAppBarMainColor(){
    return _appBarMainColor;
  }
}