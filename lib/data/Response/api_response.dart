import 'package:canwinn_project/data/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});
  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.SUCCESS;
  ApiResponse.error(this.message) : status = Status.ERROR;
  ApiResponse.noInternet(this.message) : status = Status.ERROR;
  ApiResponse.requestTimeout(this.message) : status = Status.ERROR;
  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}
