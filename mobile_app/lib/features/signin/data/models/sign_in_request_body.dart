class SignInRequestBody {
  final String email;
  final String password;

  const SignInRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
