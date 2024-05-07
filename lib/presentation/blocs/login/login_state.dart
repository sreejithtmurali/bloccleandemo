part of 'login_bloc.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess({required this.user});
}

class LoginFailure extends LoginState {}
