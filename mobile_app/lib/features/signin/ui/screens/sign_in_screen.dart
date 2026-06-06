import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/sign_in_cubit.dart';
import '../widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              verticalSpace(32),
              const SignInHeader(),
              verticalSpace(32),
              SignInForm(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                onForgotPassword: () => context.read<SignInCubit>().forgotPassword(_emailController.text.trim()),
              ),
              verticalSpace(28),
              const SignInSocialButtons(),
              const SiginInBlocListener(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: SignInFooter(onSignIn: _onSignIn, onCreateAccount: () => context.pushNamed(Routes.signUp)),
      ),
    );
  }

  void _onSignIn() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<SignInCubit>().signIn(email: _emailController.text.trim(), password: _passwordController.text);
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
