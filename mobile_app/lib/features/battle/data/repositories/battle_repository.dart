import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../dtos/battle_socket_dtos.dart';
import '../services/battle_socket_service.dart';

class BattleRepository {
  final BattleSocketService _service;

  BattleRepository(this._service);

  Future<void> connect() async {
    final token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    await _service.connect(token);
  }

  void findMatch(String categoryId) => _service.findMatch(categoryId);

  void submitAnswer({required String battleId, required String questionId, required String answer}) {
    _service.submitAnswer(battleId: battleId, questionId: questionId, answer: answer);
  }

  void disconnect() => _service.disconnect();

  Stream<MatchFoundDto> get onMatchFound => _service.onMatchFound.map(MatchFoundDto.fromJson);
  Stream<NewQuestionDto> get onNewQuestion => _service.onNewQuestion.map(NewQuestionDto.fromJson);
  Stream<ScoreUpdateDto> get onScoreUpdated => _service.onScoreUpdated.map(ScoreUpdateDto.fromJson);
  Stream<BattleEndDto> get onBattleEnd => _service.onBattleEnd.map(BattleEndDto.fromJson);
}
