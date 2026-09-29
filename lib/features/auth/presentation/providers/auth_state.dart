import '../../domain/entities/auth.dart';

class AuthState {
  final bool isLoading;
  final Auth? auth;
  final String? error;

  const AuthState({this.isLoading = false, this.auth, this.error});

  AuthState copyWith({bool? isLoading, Auth? auth, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      auth: auth ?? this.auth,
      error: error,
    );
  }
}
