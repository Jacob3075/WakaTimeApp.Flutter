import "package:bloc_test/bloc_test.dart";
import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import 'package:waka_time_app/common/data/local/user_details_store.dart';
import 'package:waka_time_app/common/data/network/errors.dart';
import 'package:waka_time_app/features/login/domain/login_uc.dart';
import "package:waka_time_app/features/login/ui/bloc/login_page_cubit.dart";

import "../../../../fixtures/sample_user_details.dart";
import "login_page_cubit_test.mocks.dart";

@GenerateMocks([LoginUC, UserDetailsStore])
void main() {
  late LoginPageCubit cubit;
  late MockUserDetailsStore store;
  late MockLoginApi loginApi;

  setUp(() {
    store = MockUserDetailsStore();
    loginApi = MockLoginApi();
    cubit = LoginPageCubit(loginApi: loginApi, store: store);
  });

  group(
    "When api key is given",
    () {
      blocTest<LoginPageCubit, LoginPageState>(
        "and api request returns valid data, then loading and success states should be emitted",
        build: () => cubit,
        setUp: () => when(loginApi.getUserDetails(any)).thenAnswer(
          (realInvocation) async => const Right(sampleUserDetails),
        ),
        act: (bloc) async => await bloc.login("api key"),
        expect: () => [
          const LoginPageState.loading(),
          const LoginPageState.success(),
        ],
        verify: (_) {
          verify(store.saveApiKey(any));
          verify(store.saveUserDetails(sampleUserDetails));
        },
      );

      blocTest<LoginPageCubit, LoginPageState>(
        "and api request returns NetworkError, then loading and error states should be emitted",
        build: () => cubit,
        setUp: () => when(loginApi.getUserDetails(any))
            .thenAnswer((realInvocation) async => const Left(Errors.network())),
        act: (bloc) async => await bloc.login("api key"),
        expect: () => [
          const LoginPageState.loading(),
          const LoginPageState.error("Network Error"),
          const LoginPageState.defaultState(),
        ],
        verify: (_) {
          verifyNever(store.saveApiKey(any));
          verifyNever(store.saveUserDetails(any));
        },
      );
    },
  );
  blocTest<LoginPageCubit, LoginPageState>(
    "When no api key is given, bloc sends error state",
    build: () => cubit,
    act: (bloc) async => await bloc.login(""),
    expect: () => [const LoginPageState.error("No Api key entered")],
  );
}
