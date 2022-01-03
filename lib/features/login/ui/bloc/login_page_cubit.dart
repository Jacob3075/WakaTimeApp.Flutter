import "package:bloc/bloc.dart";
import "package:meta/meta.dart";
import "package:waka_time_app/features/login/data/login_api.dart";

part "login_page_state.dart";

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(Default());

  final LoginApi loginApi = LoginApi();

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
