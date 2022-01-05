import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/data/user_details_store.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/login/data/login_api.dart";

part "login_page_cubit.freezed.dart";

part "login_page_state.dart";

class LoginPageCubit extends Cubit<LoginPageState> {
  final LoginApi _loginApi;
  final UserDetailsStore _store;

  LoginPageCubit({required LoginApi loginApi, required UserDetailsStore store})
      : _loginApi = loginApi,
        _store = store,
        super(const LoginPageState.defaultState());

  Future<void> login(String textFieldInput) async {
    if (textFieldInput.isEmpty) {
      emit(const LoginPageState.error("No Api key entered"));
      return;
    }

    emit(const LoginPageState.loading());

    final either = await _loginApi.getUserDetails(textFieldInput);
    either.fold(
      (errors) => emit(LoginPageState.error(errors.getErrorMessage())),
      (userDetails) async {
        await _store.saveUserDetails(userDetails);
        await _store.saveApiKey(textFieldInput);

        emit(const LoginPageState.success());
      },
    );
  }
}
