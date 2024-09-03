import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/models/movies_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository{

  BaseApiServices _apiServices=NetworkApiServices();

  Future<MoviesModel> fetchMoviesList() async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response=MoviesModel.fromJson(response);

    }catch(e){
      print(e.toString());
      throw e;
    }
  }

}