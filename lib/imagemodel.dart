class ImageModel {
  final String message;
  final String status;

  ImageModel({
    required this.message,
    required this.status,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      message: json['message'],
      status: json['status'],
    );
  }
}