import 'package:flutter/material.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:waka_time_app/common/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var client = MyOAuth2Client(
    redirectUri: WAKATIME_REDIRECT_URI,
    customUriScheme: "com.jacob.wakatimeapp",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Some Text"),
          TextButton(
            onPressed: () async => {onClick()},
            child: const Text("Login Button"),
          )
        ],
      ),
    );
  }

  Future<void> onClick() async {
    AccessTokenResponse accessTokenResponse =
        await client.getTokenWithAuthCodeFlow(
      clientId: WAKATIME_CLIENT_ID,
      clientSecret: WAKATIME_CLIENT_SECRET,
      scopes: ["email", "read_stats"],
      enablePKCE: false,
    );
    print(accessTokenResponse.accessToken);
    print(accessTokenResponse.expiresIn);
  }
}

class MyOAuth2Client extends OAuth2Client {
  MyOAuth2Client({required String redirectUri, required String customUriScheme})
      : super(
          authorizeUrl: WAKATIME_AUTH_ENDPOINT,
          tokenUrl: WAKATIME_TOKEN_ENDPOINT,
          redirectUri: redirectUri,
          customUriScheme: customUriScheme,
          credentialsLocation: CredentialsLocation.BODY,
          scopeSeparator: ",",
        );
}
