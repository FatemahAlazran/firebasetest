import 'package:firebasetest/app/modules/auth/domain/providers/state/auth_state.dart';
import 'package:firebasetest/app/modules/auth/domain/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(super.state, this._authRepository);

  final AuthRepo _authRepository;

  Future register(
      {required String email,
      required String userName,
      required String password}) async {}
}
