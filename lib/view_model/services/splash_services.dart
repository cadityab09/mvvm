import 'package:flutter/cupertino.dart';
import 'package:mvvm/models/user_model.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashServices{

  Future<UserModel> _getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async{

    _getUserData().then((value){
      if(value.token=='null' || value.token==''){
        Navigator.pushNamed(context, RouteNames.login);
      }else{
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace){
      Utils.showToastMessage(error.toString());
    });
  }
}