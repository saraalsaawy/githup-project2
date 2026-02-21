import 'package:flutter/material.dart';

extension Nav on BuildContext{
  push(Widget target){
    Navigator.push(this, MaterialPageRoute(builder: (context) {
      return target;
    },));
  }
  
  pushAndClear(Widget target){
    Navigator.pushAndRemoveUntil(this, MaterialPageRoute(builder: (context) {
      return target;
    },),(route) => false,);
  }
}