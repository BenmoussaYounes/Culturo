class VerifyEmailRequestBody {
  final String email;
  final String code;

  const VerifyEmailRequestBody({required this.email, required this.code});

  Map<String, dynamic> toJson() => {'email': email, 'code': code};
}
