import 'package:flutter/cupertino.dart';

class BMIModel{
  double bmi;
  int flag;
  bool isNormal;

  String comments;

  BMIModel({this.bmi, this.flag, this.comments,this.isNormal});
}