abstract class AuthEvent {}

class GetStartedEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
}
