import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";

part "home_page_cubit.freezed.dart";
part "home_page_state.dart";

class HomePageCubit extends Cubit<HomePageState> {
  late final UserDetails userDetails;
  late final String apiKey;
  final UserAuthCubit _userAuthCubit;

  HomePageCubit({required UserAuthCubit userAuthCubit})
      : _userAuthCubit = userAuthCubit,
        super(const HomePageState.defaultState()) {
    userDetails = _userAuthCubit.userDetails;
    apiKey = _userAuthCubit.apiKey;
  }
}
