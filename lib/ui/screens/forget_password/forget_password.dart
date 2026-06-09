import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/widgets/custom_app_bar.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/directional_icon.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    void goToPreviousScreen() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.auth_forgot_password_title,
        leading: DirectionalIcon(
          child: IconButton(
            onPressed: () => goToPreviousScreen(),
            icon: SvgPicture.asset(
              context.isDark ? AppIcons.icBackDark : AppIcons.icBackLight,
              width: 32,
              height: 32,
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),

                Image.asset(
                  context.isDark
                      ? AppImages.imgDarkForgetPassword
                      : AppImages.imgLightForgetPassword,
                ),

                const SizedBox(height: 40),

                CustomElevatedButton(
                  onPressed: () {
                    // TODO: Forgot password button
                  },
                  backgroundColor: context.colors.mainColor,
                  child: Text(
                    AppLocalizations.of(context)!.auth_reset_password,
                    style: AppStyles.semiBold14(context: context).copyWith(
                      color: context.isDark
                          ? context.colors.mainText
                          : context.colors.inputs,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
