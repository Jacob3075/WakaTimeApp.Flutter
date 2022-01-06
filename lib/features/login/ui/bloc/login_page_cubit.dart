import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/data/local/user_details_store.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/login/domain/login_uc.dart";

part "login_page_cubit.freezed.dart";
part "login_page_state.dart";

class LoginPageCubit extends Cubit<LoginPageState> {
  final LoginUC _loginApi;
  final UserDetailsStore _store;

  LoginPageCubit({required LoginUC loginApi, required UserDetailsStore store})
      : _loginApi = loginApi,
        _store = store,
        super(const LoginPageState.defaultState());

  Future<void> login(String textFieldInput) async {
    if (textFieldInput.isEmpty) {
      emit(const LoginPageState.error("No Api key entered"));
      return;
    }

    emit(const LoginPageState.loading());

    final either =
        await _loginApi(LoginUCParameters(apiKey: textFieldInput.trim()));
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
