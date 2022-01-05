part of "login_page_cubit.dart";

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState.defaultState() = Default;

  const factory LoginPageState.success() = Success;

  const factory LoginPageState.error(String errorMessage) = Error;

  const factory LoginPageState.loading() = Loading;
}
