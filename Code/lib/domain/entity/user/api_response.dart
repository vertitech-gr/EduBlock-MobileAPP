class ApiResponse {
  final bool success;
  Map<String, dynamic>? data;
  String? error;
  String message;

  ApiResponse(
      {required this.success, this.data, this.error, required this.message});

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
        success: json["success"],
        data: json["data"],
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data,
        "error": error,
        "message": message,
      };
}
