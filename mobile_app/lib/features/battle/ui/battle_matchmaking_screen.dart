import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/instrument_serif_font_style.dart';
import '../../../core/theming/inter_font_style.dart';
import '../../../core/theming/jet_brains_mono_font_style.dart';
import '../../../core/widgets/app_circular_progress_indicator.dart';
import 'cubit/battle_matchmaking_cubit.dart';
import 'widgets/widgets.dart';

class BattleMatchmakingScreen extends StatelessWidget {
  final String categoryId;

  const BattleMatchmakingScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BattleMatchmakingCubit>()..loadMatchmaking(categoryId),
      child: const BattleMatchmakingBlocListener(child: _MatchmakingContent()),
    );
  }
}

class _MatchmakingContent extends StatelessWidget {
  const _MatchmakingContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesertColors.bg,
      appBar: AppBar(
        backgroundColor: DesertColors.bg,
        elevation: 0,
        leading: const BackButton(color: DesertColors.ink),
        centerTitle: true,
        title: Text('Battle 1v1', style: InstrumentSerifFontStyle.font18W400Ink),
      ),
      body: BlocBuilder<BattleMatchmakingCubit, BattleMatchmakingState>(
        builder: (context, state) => switch (state) {
          BattleMatchmakingInitial() => const AppCircularProgressIndicator(),
          BattleMatchmakingNavigateToGame() => const AppCircularProgressIndicator(),
          BattleMatchmakingPop() => const AppCircularProgressIndicator(),
          BattleMatchmakingSearching() => _MatchmakingBody(state: state),
        },
      ),
    );
  }
}

class _MatchmakingBody extends StatelessWidget {
  final BattleMatchmakingSearching state;

  const _MatchmakingBody({required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'RECHERCHE D\'UN ADVERSAIRE',
            style: JetBrainsMonoFontStyle.font10W500MediumGrey.copyWith(letterSpacing: 1.0),
          ),
          verticalSpace(6),
          Text('Match en cours...', style: InstrumentSerifFontStyle.font26W400ItalicInk),
          if (state.countdown != null)
            Text(
              '${state.countdown} secondes restantes',
              style: InstrumentSerifFontStyle.font26W400ItalicInk.copyWith(color: DesertColors.accent),
            ),
          verticalSpace(20),
          BattleVsRow(
            playerName: state.playerName,
            playerInitial: state.playerInitial,
            playerAvatarBg: state.playerAvatarBg,
            playerLocation: state.playerLocation,
            playerRank: state.playerRank,
          ),
          verticalSpace(6),
          Text('ELO ${state.playerElo}', style: JetBrainsMonoFontStyle.font10W500MediumGrey),
          verticalSpace(20),
          BattleMatchSettingsCard(settings: state.settings),
          verticalSpace(14),
          BattleInviteSection(inviteLink: state.inviteLink),
          verticalSpace(16),
          _CancelButton(onTap: () => context.read<BattleMatchmakingCubit>().onCancelTapped()),
        ],
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CancelButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: ColorsManager.mediumGrey.withValues(alpha: 0.4)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          backgroundColor: DesertColors.surface,
        ),
        child: Text('Annuler', style: InterFontStyle.font14W600Ink),
      ),
    );
  }
}
