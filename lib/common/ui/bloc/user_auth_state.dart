part of "user_auth_cubit.dart";

@freezed
class UserAuthState with _$UserAuthState {
  const factory UserAuthState.loading() = Loading;

  const factory UserAuthState.loggedOut() = LoggedOut;

  const factory UserAuthState.loggedIn() = LoggedIn;
}
