import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices=NetworkApiServices();

  Future<dynamic> loginAPi(dynamic data) async{
    dynamic response;
    try{
     response = _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
    }catch(e){
      throw e;
    }
    return response;
  }

  Future<dynamic> signupApi(dynamic data) async{
    dynamic response;
    try{
      response = _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
    }catch(e){
      throw e;
    }
    return response;
  }
}