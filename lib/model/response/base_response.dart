abstract class BaseResponse {
  int? status;
  String? message;
  BaseResponse(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
