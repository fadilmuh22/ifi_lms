class ApiResponseModel {
  int status;
  dynamic data;

  ApiResponseModel({required this.status, this.data});

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      status: json['status'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data,
    };
  }
}
