import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repositories/ranking_repository.dart';
import '../../domain/models/leaderboard_player_model.dart';
import '../../domain/models/ranking_entry_model.dart';

part 'ranking_state.dart';

class RankingCubit extends Cubit<RankingState> {
  final RankingRepository _repository;

  RankingCubit(this._repository) : super(RankingInitial());

  Future<void> loadRanking() async {
    emit(RankingInitial());

    final result = await _repository.getLeaderboard();

    result.when(
      success: (List<LeaderboardPlayerModel> players) {
        if (players.isEmpty) {
          emit(RankingError('Aucun joueur classé pour le moment.'));
          return;
        }
        final entries = players.indexed.map((e) => _toDisplayModel(rank: e.$1 + 1, player: e.$2)).toList();
        emit(
          RankingLoaded(
            weekLabel: '',
            scopePrefix: 'Monde entier',
            totalPlayersLabel: '${players.length}',
            topEntry: entries.first,
            entries: entries,
          ),
        );
      },
      failure: (error) => emit(RankingError(error.message)),
    );
  }

  RankingEntryModel _toDisplayModel({required int rank, required LeaderboardPlayerModel player}) {
    final initial = player.username.isNotEmpty ? player.username[0].toUpperCase() : '?';
    final xp = player.xp;
    final ptsFormatted = _formatPts(xp);
    final scoreFormatted = xp >= 1000 ? '${(xp / 1000.0).toStringAsFixed(1).replaceAll('.', ',')}k' : '$xp';

    return RankingEntryModel(
      rank: rank,
      username: player.username,
      initial: initial,
      level: player.level,
      ptsFormatted: ptsFormatted,
      scoreFormatted: scoreFormatted,
      avatarBg: _parseColor(player.color),
    );
  }

  String _formatPts(int xp) {
    if (xp < 1000) return '$xp';
    final s = xp.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(' ');
      buf.write(s[i]);
    }
    return buf.toString();
  }

  Color _parseColor(String hex) {
    try {
      final cleaned = hex.replaceAll('#', '');
      final padded = cleaned.padLeft(6, '0');
      return Color(int.parse('FF$padded', radix: 16));
    } catch (_) {
      return const Color(0xFF2A6B4A);
    }
  }
}
