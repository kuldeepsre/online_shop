part of 'authentication_bloc.dart';

// Events
abstract class AuthenticationEvent {}

class LoginRequested extends AuthenticationEvent {
  final String username;
  final String password;

  LoginRequested(this.username, this.password);
}