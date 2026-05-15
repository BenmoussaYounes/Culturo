class SiginInResponse {
  final String accessToken;
  SiginInResponse({required this.accessToken});

  factory SiginInResponse.fromJson(Map<String, dynamic> json) {
    return SiginInResponse(accessToken: json['accessToken']);
  }
}
