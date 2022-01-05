import "package:bloc/bloc.dart";
import "package:meta/meta.dart";
import "package:waka_time_app/common/data/user_details_store.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/login/data/login_api.dart";

part "login_page_state.dart";

class LoginPageCubit extends Cubit<LoginPageState> {
  final LoginApi loginApi;
  final UserDetailsStore store;

  LoginPageCubit({required this.loginApi, required this.store})
      : super(Default());

  void login(String textFieldInput) async {
    if (textFieldInput.isEmpty) {
      emit(Error("No Api key entered"));
      return;
    }

    emit(Loading());

    final either = await loginApi.getUserDetails(textFieldInput);
    either.fold(
      (errors) => emit(Error(errors.getErrorMessage())),
      (userDetails) async {
        await store.saveUserDetails(userDetails);
        await store.saveApiKey(textFieldInput);

        emit(Success());
      },
    );
  }
}
