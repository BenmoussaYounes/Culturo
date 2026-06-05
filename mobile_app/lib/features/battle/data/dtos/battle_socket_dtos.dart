class MatchFoundDto {
  final String battleId;
  final String opponentUsername;
  final int opponentElo;

  MatchFoundDto({required this.battleId, required this.opponentUsername, required this.opponentElo});

  factory MatchFoundDto.fromJson(Map<String, dynamic> json) {
    final opponent = json['opponent'] as Map<String, dynamic>? ?? {};
    return MatchFoundDto(
      battleId: json['battleId'] as String? ?? '',
      opponentUsername: opponent['username'] as String? ?? 'Adversaire',
      opponentElo: opponent['elo'] as int? ?? 0,
    );
  }
}

class QuestionOptionDto {
  final String letter;
  final String text;

  const QuestionOptionDto({required this.letter, required this.text});

  factory QuestionOptionDto.fromJson(Map<String, dynamic> json) =>
      QuestionOptionDto(letter: json['letter'] as String? ?? '', text: json['text'] as String? ?? '');
}

class NewQuestionDto {
  final String questionId;
  final String question;
  final List<QuestionOptionDto> options;
  final int timeLimit;
  final int round;
  final int totalRounds;

  NewQuestionDto({
    required this.questionId,
    required this.question,
    required this.options,
    required this.timeLimit,
    required this.round,
    required this.totalRounds,
  });

  factory NewQuestionDto.fromJson(Map<String, dynamic> json) {
    final opts = (json['options'] as List<dynamic>? ?? [])
        .map((o) => QuestionOptionDto.fromJson(o as Map<String, dynamic>))
        .toList();
    return NewQuestionDto(
      questionId: json['questionId'] as String? ?? '',
      question: json['question'] as String? ?? '',
      options: opts,
      timeLimit: json['timeLimit'] as int? ?? 15,
      round: json['round'] as int? ?? 1,
      totalRounds: json['totalRounds'] as int? ?? 7,
    );
  }
}

class ScoreUpdateDto {
  final int myScore;
  final int opponentScore;
  final bool myAnswered;
  final bool opponentAnswered;
  final String? correctAnswer;

  ScoreUpdateDto({
    required this.myScore,
    required this.opponentScore,
    required this.myAnswered,
    required this.opponentAnswered,
    this.correctAnswer,
  });

  factory ScoreUpdateDto.fromJson(Map<String, dynamic> json) => ScoreUpdateDto(
    myScore: json['myScore'] as int? ?? 0,
    opponentScore: json['opponentScore'] as int? ?? 0,
    myAnswered: json['myAnswered'] as bool? ?? false,
    opponentAnswered: json['opponentAnswered'] as bool? ?? false,
    correctAnswer: json['correctAnswer'] as String?,
  );
}

class BattleEndDto {
  final String winnerId;
  final int myScore;
  final int opponentScore;

  BattleEndDto({required this.winnerId, required this.myScore, required this.opponentScore});

  factory BattleEndDto.fromJson(Map<String, dynamic> json) => BattleEndDto(
    winnerId: json['winnerId'] as String? ?? '',
    myScore: json['myScore'] as int? ?? 0,
    opponentScore: json['opponentScore'] as int? ?? 0,
  );
}
