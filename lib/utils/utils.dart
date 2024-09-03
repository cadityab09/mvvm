

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{


  static double calculateAvgRating(List<int> rating){
    var avgRating=0;
    for(int i in rating){
      avgRating+=i;
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(2));
  }

  static void showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      // backgroundColor: Colors.green,
      // textColor: Colors.yellow
      toastLength: Toast.LENGTH_LONG

    );
  }

  static void showFlushMessage(String msg,BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          message: msg,
          animationDuration: Duration(seconds: 1),
          backgroundColor: Colors.redAccent,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(5),
          icon: Icon(Icons.error,color: Colors.white,),
          duration: Duration(seconds: 3),
          positionOffset: 20,

          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
        )..show(context),
    );
  }

  static  showSnackBar(String message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        // showCloseIcon: true,
        duration: Duration(seconds: 3),
        // backgroundColor: Colors.red,
      ),
    );
  }

  static feildFocusChange(BuildContext context,FocusNode currentFocus,FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}