import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/data/local/user_details_store.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/features/login/domain/get_user_details_uc.dart";

part "login_page_cubit.freezed.dart";
part "login_page_state.dart";

@injectable
class LoginPageCubit extends Cubit<LoginPageState> {
  final GetUserDetailsUC _loginApi;
  final UserDetailsStore _store;
  final UserAuthCubit _userAuthCubit;

  LoginPageCubit({
    required GetUserDetailsUC loginApi,
    required UserDetailsStore store,
    required UserAuthCubit userAuthCubit,
  })  : _loginApi = loginApi,
        _store = store,
        _userAuthCubit = userAuthCubit,
        super(const LoginPageState.defaultState());

  Future<void> login(String textFieldInput) async {
    if (textFieldInput.isEmpty) {
      emit(const LoginPageState.error("No Api key entered"));
      return;
    }

    emit(const LoginPageState.loading());

    final either = await _loginApi(GetUserDetailsUCParameters(apiKey: textFieldInput.trim()));
    either.fold(
      (errors) => emit(LoginPageState.error(errors.getErrorMessage())),
      (userDetails) async {
        await _store.saveUserDetails(userDetails);
        await _store.saveApiKey(textFieldInput);
        await _userAuthCubit.updateLoginStateAndDetails();

        emit(const LoginPageState.success());
      },
    );
  }
}
