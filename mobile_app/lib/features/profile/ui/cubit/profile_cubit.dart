import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repositories/profile_repository.dart';
import '../../domain/models/profile_model.dart';
import '../../domain/models/user_profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;

  ProfileCubit(this._repository) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileInitial());

    final result = await _repository.getProfile();

    result.when(
      success: (UserProfileModel raw) => emit(ProfileLoaded(profile: _toDisplayModel(raw))),
      failure: (error) => emit(ProfileError(error.message)),
    );
  }

  ProfileModel _toDisplayModel(UserProfileModel raw) {
    final initial = raw.username.isNotEmpty ? raw.username[0].toUpperCase() : '?';

    return ProfileModel(
      username: raw.username,
      email: raw.email,
      initial: initial,
      avatarBgColor: _parseColor(raw.color),
      memberSinceLabel: _formatMemberSince(raw.createdAt),
      xp: raw.xp,
      level: raw.level,
      isBattleUnlocked: raw.isBattleUnlocked,
    );
  }

  String _formatMemberSince(String createdAt) {
    final dt = DateTime.tryParse(createdAt);
    if (dt == null) return '';
    const months = ['janv.', 'fév.', 'mars', 'avr.', 'mai', 'juin', 'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.'];
    return 'membre depuis ${months[dt.month - 1]} ${dt.year}';
  }

  Color _parseColor(String hex) {
    try {
      final cleaned = hex.replaceAll('#', '');
      final padded = cleaned.padLeft(6, '0');
      return Color(int.parse('FF$padded', radix: 16));
    } catch (_) {
      return const Color(0xFF2D6A4F);
    }
  }
}
