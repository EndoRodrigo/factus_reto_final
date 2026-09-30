import 'package:factus_reto_final/features/auth/domain/usecases/auth_usecases.dart';
import 'package:factus_reto_final/features/auth/presentation/providers/auth_providers.dart';
import 'package:factus_reto_final/features/auth/presentation/providers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthUsecases _authUseCase;

  @override
  AuthState build() {
    _authUseCase = ref.watch(loginUseCaseProvider);
    return const AuthState();
  }

  Future<void> login() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final auth = await _authUseCase();

      state = state.copyWith(isLoading: false, auth: auth);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> logout() async {
    state = const AuthState();
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
