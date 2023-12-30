abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class SuccessState extends AuthState {
  final dynamic data;

  SuccessState({required this.data});
}

class ErrorState extends AuthState {
  final String error;

  ErrorState({required this.error});
}
