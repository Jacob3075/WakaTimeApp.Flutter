part of "home_page_cubit.dart";

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.authError() = AuthError;

  const factory HomePageState.loading() = Loading;

  const factory HomePageState.error(String error) = Error;

  const factory HomePageState.loaded(StatsForDuration last7DaysStats) = Loaded;
}
