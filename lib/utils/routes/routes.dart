import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/view/signup_screen.dart';
import 'package:mvvm/view/splash_screen.dart';

class Routes {

  static Route<dynamic> generateRoutes(RouteSettings setting){
    switch(setting.name){

      case RouteNames.splash:
        return MaterialPageRoute(builder: (context)=>SplashScreen());

      case RouteNames.home:
        return MaterialPageRoute(builder: (context)=>HomeScreen());

      case RouteNames.login:
        return MaterialPageRoute(builder: (context)=>LoginScreen());

      case RouteNames.signup:
        return MaterialPageRoute(builder: (context)=>SignupScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
              appBar: AppBar(
                title: Text('Default'),
                centerTitle: true,
                backgroundColor: Colors.deepPurple,
              ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('No routes defines'))
              ],
            ),
            );
        });
    }
  }
}