import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quiz_cubit.dart';
import '../quiz_result_screen.dart';

class QuizBlocListener extends StatelessWidget {
  final Widget child;

  const QuizBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizCubit, QuizState>(
      listener: (context, state) => switch (state) {
        QuizCompleted() => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => QuizResultScreen(result: state)),
        ),
        QuizSubmitError(:final message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message))),
        _ => null,
      },
      child: child,
    );
  }
}
