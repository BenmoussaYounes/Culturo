class SignUpRequestBody {
  final String email;
  final String password;

  const SignUpRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
