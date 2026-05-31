class SignUpRequestBody {
  final String email;
  final String password;
  final String code;

  const SignUpRequestBody({required this.email, required this.password, required this.code});

  Map<String, dynamic> toJson() => {'email': email, 'password': password, 'code': code};
}
