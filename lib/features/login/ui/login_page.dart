import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:url_launcher/url_launcher.dart";
import "package:waka_time_app/common/ui/routing/routes.gr.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/utils/constants.dart";
import "package:waka_time_app/di/injection.dart";
import "package:waka_time_app/features/login/ui/bloc/login_page_cubit.dart";
import "package:waka_time_app/features/login/ui/widgets/api_key_input_field.dart";
import "package:waka_time_app/features/login/ui/widgets/login_button.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final apiKeyTextController = TextEditingController();
  BuildContext? dialogContext;

  @override
  void dispose() {
    apiKeyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (context) => getIt<LoginPageCubit>(),
            child: BlocConsumer<LoginPageCubit, LoginPageState>(
              listener: (context, state) {
                state.when(
                  success: () => context.router.replace(const HomePageRoute()),
                  error: (error) => ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(error))),
                  loading: () => showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      dialogContext = context;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  defaultState: () => null,
                );
                if (dialogContext != null && state is! Loading) {
                  Navigator.pop(dialogContext!);
                  dialogContext = null;
                }
              },
              builder: (context, _) => _buildDefaultStatePage(context),
            ),
          ),
        ),
      );

  Widget _buildDefaultStatePage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _appTitle(),
          ApiKeyInputField(
            onTap: _openLink,
            textController: apiKeyTextController,
            decoration: _createShadowDecoration(20),
          ),
          LoginButton(
            onPressed: _onLoginButtonPressed,
            decoration: _createShadowDecoration(50),
          ),
        ],
      );

  Widget _appTitle() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "Wakatime Client",
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Future<bool> _openLink() async => await launch(Constants.apiKeyUrl);

  void _onLoginButtonPressed(BuildContext context) async =>
      await context.read<LoginPageCubit>().login(apiKeyTextController.text);

  BoxDecoration _createShadowDecoration(double borderRadius) => BoxDecoration(
        color: AppColors.cardBGPrimary,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      );
}
