import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/screens/on_boarding/widgets/custom_form_field.dart';
import 'package:evently/ui/widgets/custom_app_bar.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_text_button.dart';
import 'package:evently/ui/widgets/custom_text_divider.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:evently/utils/resources/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    late final TextEditingController emailController = TextEditingController();
    late final TextEditingController passwordController =
        TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Image.asset(
          context.isDark
              ? AppImages.logoEventlyDark
              : AppImages.logoEventlyLight,
          height: 26,
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.auth_login_title,
                    style: AppStyles.semiBold24(context: context),
                  ),

                  const SizedBox(height: 24),
                  CustomFormField(
                    controller: emailController,
                    validator: (value) =>
                        AppValidator.validateEmail(value, context),
                    hintText: AppLocalizations.of(context)!.auth_email_hint,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                      child: SvgPicture.asset(
                        AppIcons.icEmail,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),
                  CustomFormField(
                    controller: passwordController,
                    validator: (value) =>
                        AppValidator.validatePassword(value, context),
                    hintText: AppLocalizations.of(context)!.auth_password_hint,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                      child: SvgPicture.asset(
                        AppIcons.icPassword,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    isPassword: true,
                    icShowPassword: AppIcons.icEyeOff,
                    icHidePassword: AppIcons.icEyeOn,
                  ),

                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,

                    child: CustomTextButton(
                      text: AppLocalizations.of(context)!.auth_forgot_password,
                      textStyle: AppStyles.semiBold14(context: context),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.forgotPassword);
                      },
                    ),
                  ),

                  const SizedBox(height: 40),
                  CustomElevatedButton(
                    onPressed: () {
                      // TODO: Login button
                      if (!_key.currentState!.validate()) {
                        return;
                      }
                      emailController.clear();
                      passwordController.clear();
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(AppRoutes.bottomNav);
                    },
                    backgroundColor: context.colors.mainColor,
                    child: Text(
                      AppLocalizations.of(context)!.auth_login_button,
                      style: AppStyles.semiBold14(context: context).copyWith(
                        color: context.isDark
                            ? context.colors.mainText
                            : context.colors.inputs,
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.auth_no_account,
                        style: AppStyles.regular14(
                          context: context,
                        ).copyWith(color: context.colors.secText),
                      ),

                      CustomTextButton(
                        text: AppLocalizations.of(context)!.auth_signup,
                        textStyle: AppStyles.semiBold14(context: context),
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRoutes.register);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  CustomTextDivider(
                    text: AppLocalizations.of(context)!.common_or,
                    color: context.colors.mainColor,
                  ),

                  const SizedBox(height: 24),

                  CustomElevatedButton(
                    onPressed: () {
                      // TODO: Google login button
                    },
                    backgroundColor: context.colors.inputs,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.logoGoogle,
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          AppLocalizations.of(context)!.auth_google_login,
                          style: AppStyles.semiBold14(context: context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
