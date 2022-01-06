import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "home_page_cubit.freezed.dart";
part "home_page_state.dart";

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState.defaultState());
}
