import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/route_names.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _loading=false;
  bool get laoding => _loading;

  setLoading(bool value){
    _loading=value;
  }

  bool _signupLoading=false;
  bool get signupLoading => _signupLoading;

  setSignupLoading(bool value){
    _signupLoading=value;
  }

  Future<void>  loginApi(dynamic data, BuildContext context)async{
    setLoading(true);
    _myRepo.loginAPi(data).then((value){

      final userViewModel = Provider.of<UserViewModel>(context,listen: false);

      userViewModel.saveUser(value['token'].toString());

      Utils.showFlushMessage('Login Successfully', context);
      setLoading(false);
      Navigator.pushNamed(context, RouteNames.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      Utils.showFlushMessage(error.toString(), context);
      setLoading(false);
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
  Future<void> signupApi(dynamic data, BuildContext context)async{
    setSignupLoading(true);
    _myRepo.signupApi(data).then((value){
      Utils.showFlushMessage('Signup Successfully', context);
      setSignupLoading(false);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      Utils.showFlushMessage(error.toString(), context);
      setSignupLoading(false);
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}