import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:waka_time_app/common/data/local/user_details_store.dart";
import "package:waka_time_app/features/login/domain/get_user_details_uc.dart";

@GenerateMocks([http.Client, GetUserDetailsUC, UserDetailsStore])
main() {}
