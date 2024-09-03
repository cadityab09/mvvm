import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? msg;

  ApiResponse(this.status, this.data, this.msg);

  ApiResponse.loading() : status =Status.LOADING;
  ApiResponse.completed(this.data) : status =Status.COMPLETED;
  ApiResponse.error(this.msg) : status =Status.ERROR;

  String toString(){
    return "Status : $status \n message : $msg \n Data : $data";
  }
}