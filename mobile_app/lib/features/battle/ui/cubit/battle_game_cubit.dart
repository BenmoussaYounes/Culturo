import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/battle_game_models.dart';
import '../../../../core/theming/colors_manager.dart';

part 'battle_game_state.dart';

class BattleGameCubit extends Cubit<BattleGameState> {
  BattleGameCubit() : super(BattleGameInitial());

  void loadGame() {
    emit(
      BattleGameInProgress(
        player1Name: 'Amine (toi)',
        player1Initial: 'A',
        player1AvatarBg: DesertColors.primary,
        player1Answered: true,
        player1Score: 3,
        player2Name: 'Yacine-O',
        player2Initial: 'Y',
        player2AvatarBg: const Color(0xFFD4891A),
        player2Thinking: true,
        player2Score: 2,
        currentRound: 6,
        totalRounds: 7,
        category: 'Musique',
        timerLabel: '0:08',
        timerProgress: 0.53,
        questionBefore: 'Qui est considéré comme le « ',
        questionHighlight: 'cardinal',
        questionAfter: ' » du Chaâbi algérien ?',
        answers: const [
          BattleAnswerModel(letter: 'A', text: 'Cheikh El Hasnaoui'),
          BattleAnswerModel(letter: 'B', text: 'Dahmane El Harrachi', state: BattleAnswerState.selectedWrong),
          BattleAnswerModel(letter: 'C', text: 'El Hadj M\'Hamed El Anka', state: BattleAnswerState.correct),
          BattleAnswerModel(letter: 'D', text: 'Cheikha Rimitti'),
        ],
      ),
    );
  }
}
