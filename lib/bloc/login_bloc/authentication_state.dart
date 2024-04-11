part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}
final class SuccessState extends AuthenticationState {}
final class FailerState extends AuthenticationState {}
final class LoadingState extends AuthenticationState {}
