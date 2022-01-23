import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:waka_time_app/common/data/local/user_details_store.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/features/login/domain/get_user_details_uc.dart";
import "package:waka_time_app/features/project_stats/domain/usecases/get_project_details_uc.dart";
import "package:waka_time_app/features/project_stats/domain/usecases/get_project_stats_uc.dart";

@GenerateMocks([
  http.Client,
  GetUserDetailsUC,
  UserDetailsStore,
  FlutterSecureStorage,
  GetProjectStatsUC,
  GetProjectDetailsUC,
  UserAuthCubit,
])
main() {}
