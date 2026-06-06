import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/profile_cubit.dart';

class ProfileBlocListener extends StatelessWidget {
  final Widget child;

  const ProfileBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) => switch (state) {
        ProfileLoggedOut() => context.pushNamedAndRemoveUntil(Routes.signIn, predicate: (_) => false),
        _ => null,
      },
      child: child,
    );
  }
}
