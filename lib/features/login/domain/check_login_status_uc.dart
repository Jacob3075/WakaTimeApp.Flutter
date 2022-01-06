import "package:waka_time_app/common/data/local/user_details_store.dart";
import "package:waka_time_app/common/domain/base_use_case.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";

class CheckAuthStatusUC
    extends BaseUseCase<CheckAuthStatusUCParameters, Future<String?>> {
  final UserDetailsStore _store;

  CheckAuthStatusUC({required UserDetailsStore store})
      : _store = store,
        super();

  /// Checks if either apiKey or userDetails in [UserDetailsStore] is null,
  /// if one of them is then it returns false
  @override
  Future<String?> call([BaseUseCaseParameters? parameters]) async {
    final Future<String?> apiKeyFuture = _store.getApiKey();
    final Future<UserDetails?> userDetailsFuture = _store.getUserDetails();

    final apiKey = await apiKeyFuture;
    final userDetails = await userDetailsFuture;
    final status = !((apiKey) == null || (userDetails) == null);

    if (status) {
      return apiKey;
    } else {
      return null;
    }
  }
}

class CheckAuthStatusUCParameters extends BaseUseCaseParameters {}
