import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 24,
          children: [
            Text(
              AppLocalizations.of(context)!.auth_login_title,
              style: AppStyles.semiBold20().copyWith(
                color: context.colors.mainText,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.bottomNav);
              },

              style: ElevatedButton.styleFrom(
                minimumSize: const Size(160, 50),
                backgroundColor: context.colors.background.withValues(
                  alpha: .2,
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.auth_login_button,
                style: AppStyles.regular14(
                  context: context,
                ).copyWith(color: context.colors.mainText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
