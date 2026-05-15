enum BattleAnswerState { unanswered, selectedWrong, correct }

class BattleAnswerModel {
  final String letter;
  final String text;
  final BattleAnswerState state;

  const BattleAnswerModel({required this.letter, required this.text, this.state = BattleAnswerState.unanswered});
}

class BattleMatchSettingsModel {
  final int rounds;
  final int secondsPerQuestion;
  final String category;
  final String difficulty;

  const BattleMatchSettingsModel({
    required this.rounds,
    required this.secondsPerQuestion,
    required this.category,
    required this.difficulty,
  });
}
