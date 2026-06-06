part of 'battle_matchmaking_cubit.dart';

sealed class BattleMatchmakingState {}

final class BattleMatchmakingInitial extends BattleMatchmakingState {}

final class BattleMatchmakingSearching extends BattleMatchmakingState {
  final String playerName;
  final String playerInitial;
  final Color playerAvatarBg;
  final String playerLocation;
  final String playerRank;
  final int playerElo;
  final int? countdown;
  final BattleMatchSettingsModel settings;
  final String inviteLink;

  BattleMatchmakingSearching({
    required this.playerName,
    required this.playerInitial,
    required this.playerAvatarBg,
    required this.playerLocation,
    required this.playerRank,
    required this.playerElo,
    this.countdown,
    required this.settings,
    required this.inviteLink,
  });
}

final class BattleMatchmakingNavigateToGame extends BattleMatchmakingState {
  final String battleId;
  final String playerName;
  final String playerInitial;
  final Color playerAvatarBg;
  final String opponentName;
  final int opponentElo;

  BattleMatchmakingNavigateToGame({
    required this.battleId,
    required this.playerName,
    required this.playerInitial,
    required this.playerAvatarBg,
    required this.opponentName,
    required this.opponentElo,
  });
}

final class BattleMatchmakingPop extends BattleMatchmakingState {}
