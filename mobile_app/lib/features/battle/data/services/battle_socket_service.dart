import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../../../core/networking/api_constants.dart';

class BattleSocketService {
  io.Socket? _socket;

  final _matchFoundController = StreamController<Map<String, dynamic>>.broadcast();
  final _scoreUpdatedController = StreamController<Map<String, dynamic>>.broadcast();
  final _newQuestionController = StreamController<Map<String, dynamic>>.broadcast();
  final _battleEndController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get onMatchFound => _matchFoundController.stream;
  Stream<Map<String, dynamic>> get onScoreUpdated => _scoreUpdatedController.stream;
  Stream<Map<String, dynamic>> get onNewQuestion => _newQuestionController.stream;
  Stream<Map<String, dynamic>> get onBattleEnd => _battleEndController.stream;

  bool get isConnected => _socket?.connected == true;

  Future<void> connect(String token) {
    if (isConnected) return Future.value();

    final completer = Completer<void>();
    _socket?.dispose();

    _socket = io.io(
      ApiConstants.battleSocketUrl,
      io.OptionBuilder().setTransports(['websocket']).setAuth({'token': token}).disableAutoConnect().build(),
    );

    _socket!.onConnect((_) {
      debugPrint('BattleSocket connected');
      if (!completer.isCompleted) completer.complete();
    });

    _socket!.onConnectError((e) {
      debugPrint('BattleSocket connect error: $e');
      if (!completer.isCompleted) {
        completer.completeError(Exception('Socket connection failed'));
      }
    });

    _socket!.onDisconnect((_) => debugPrint('BattleSocket disconnected'));

    _socket!.on('matchFound', (data) {
      if (!_matchFoundController.isClosed) {
        _matchFoundController.add(Map<String, dynamic>.from(data as Map));
      }
    });

    _socket!.on('scoreUpdated', (data) {
      if (!_scoreUpdatedController.isClosed) {
        _scoreUpdatedController.add(Map<String, dynamic>.from(data as Map));
      }
    });

    _socket!.on('newQuestion', (data) {
      if (!_newQuestionController.isClosed) {
        _newQuestionController.add(Map<String, dynamic>.from(data as Map));
      }
    });

    _socket!.on('battleEnd', (data) {
      if (!_battleEndController.isClosed) {
        _battleEndController.add(Map<String, dynamic>.from(data as Map));
      }
    });

    _socket!.connect();
    return completer.future;
  }

  void findMatch(String categoryId) {
    _socket?.emit('findMatch', {'categoryId': categoryId});
  }

  void submitAnswer({required String battleId, required String questionId, required String answer}) {
    _socket?.emit('submitAnswer', {'battleId': battleId, 'questionId': questionId, 'answer': answer});
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
  }
}
