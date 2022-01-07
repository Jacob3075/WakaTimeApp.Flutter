import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/features/login/domain/check_auth_status_uc.dart";
import "package:waka_time_app/features/login/domain/get_user_details_uc.dart";

part "user_auth_cubit.freezed.dart";
part "user_auth_state.dart";

class UserAuthCubit extends Cubit<UserAuthState> {
  final CheckAuthStatusUC _checkAuthStatus;
  final GetUserDetailsUC _getUserDetailsUC;

  late UserDetails userDetails;
  late String apiKey;

  UserAuthCubit({
    required CheckAuthStatusUC checkAuthStatus,
    required GetUserDetailsUC getUserDetailsUC,
  })  : _checkAuthStatus = checkAuthStatus,
        _getUserDetailsUC = getUserDetailsUC,
        super(const UserAuthState.loading());

  Future<String> updateLoginStateAndDetails() async {
    final maybeKey = await _checkAuthStatus();
    if (maybeKey == null) {
      emit(const UserAuthState.loggedOut());
    } else {
      final result = await _getUserDetailsUC(GetUserDetailsUCParameters(apiKey: maybeKey));
      result.fold(
        (error) => emit(const UserAuthState.loggedOut()),
        (data) {
          emit(const UserAuthState.loggedIn());
          apiKey = maybeKey;
          userDetails = data;
        },
      );
    }
    return ""; // needs to return something
  }
}
