import 'package:flutter/material.dart';
import 'package:mvvm/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future<void> saveUser(String token) async{
    final sp=await SharedPreferences.getInstance();
    sp.setString('token', token);
    notifyListeners();
  }

  Future<UserModel> getUser() async{
    final sp=await SharedPreferences.getInstance();
    notifyListeners();
    return UserModel(token:sp.get('token').toString());
  }

  Future<bool> removeUser() async{
    final sp=await SharedPreferences.getInstance();
    sp.remove('token');
    notifyListeners();
    return true;
  }
}