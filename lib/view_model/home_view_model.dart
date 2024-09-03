import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/models/movies_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier{

  final _homeRepo = HomeRepository();

  ApiResponse<MoviesModel> moviesList=ApiResponse.loading();

  setApiResponse(ApiResponse<MoviesModel> response){
    moviesList=response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async{
    setApiResponse(ApiResponse.loading());
    _homeRepo.fetchMoviesList().then((value){
      setApiResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setApiResponse(ApiResponse.error(error.toString()));
    });
  }
}