part of "login_page_cubit.dart";

// TODO: UPDATE TO USE FREEZED
@immutable
abstract class LoginPageState {}

class Default extends LoginPageState {}

class Success extends LoginPageState {}

class Error extends LoginPageState {
  final String errorMessage;

  Error(this.errorMessage);
}

class Loading extends LoginPageState {}
