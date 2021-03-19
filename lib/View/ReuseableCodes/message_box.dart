import  'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';

class MessageBox  {


  Widget Display(BuildContext context,String title,String message,Color color){
    return Flushbar(
      backgroundColor: color,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      title: title,
      message: message,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(8),

      blockBackgroundInteraction: true,
      dismissDirection:
      FlushbarDismissDirection.VERTICAL,
    )..show(context);
  }
}
