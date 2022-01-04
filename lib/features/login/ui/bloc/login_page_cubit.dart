import "package:bloc/bloc.dart";
import "package:meta/meta.dart";
import "package:waka_time_app/common/data/api_key_store.dart";
import "package:waka_time_app/features/login/data/login_api.dart";

part "login_page_state.dart";

class LoginPageCubit extends Cubit<LoginPageState> {
  final LoginApi loginApi;
  final ApiKeyStore store;

  LoginPageCubit({required this.loginApi, required this.store})
      : super(Default());

  void login(String textFieldInput) async {
    if (textFieldInput.isEmpty) {
      emit(Error("No Api key entered"));
      return;
    }

    final userDetails = await loginApi.testApiKey(textFieldInput);

    //TODO: SAVE TO DEVICE
    emit(Success());
  }
}
