import "dart:async";

import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";

part "home_page_cubit.freezed.dart";
part "home_page_state.dart";

class HomePageCubit extends Cubit<HomePageState> {
  late final UserDetails _userDetails;
  late final String _apiKey;
  final UserAuthCubit _userAuthCubit;
  late final StreamSubscription _userAuthStreamSub;

  HomePageCubit({required UserAuthCubit userAuthCubit})
      : _userAuthCubit = userAuthCubit,
        super(const HomePageState.defaultState()) {
    _userAuthStreamSub = _userAuthCubit.stream.listen((event) => event.maybeWhen(
          loggedIn: (apiKey, userDetails) {
            _apiKey = apiKey;
            _userDetails = userDetails;
          },
          orElse: () => null,
        ));
  }

  @override
  Future<void> close() {
    _userAuthStreamSub.cancel();
    return super.close();
  }
}
