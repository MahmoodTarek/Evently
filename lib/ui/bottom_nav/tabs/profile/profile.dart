import 'dart:io';

import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/bottom_nav/tabs/profile/pick_image.dart';
import 'package:evently/ui/bottom_nav/tabs/profile/widgets/action_card.dart';
import 'package:evently/ui/bottom_nav/tabs/profile/widgets/bottom_nav/language_bottom_sheet.dart';
import 'package:evently/ui/bottom_nav/tabs/profile/widgets/circle_picture.dart';
import 'package:evently/ui/bottom_nav/tabs/profile/widgets/theme_lottie_toggle.dart';
import 'package:evently/ui/widgets/directional_icon.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? imageFile;

  Future<void> handlePickImage() async {
    final file = await pickImage();
    if (file == null) return;
    setState(() {
      imageFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    String icLanguagePath = context.isDark
        ? AppIcons.icRightArrowDark
        : AppIcons.icRightArrow;

    String icProfilePacPlaceHolder = context.isDark
        ? AppImages.placeHolderProfilePicDark
        : AppImages.placeHolderProfilePic;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, right: 16, left: 16),
        child: Column(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: handlePickImage,
              child: CirclePicture(
                imagePath: icProfilePacPlaceHolder,
                imageFile: imageFile,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'User Name',
              style: AppStyles.semiBold20().copyWith(
                color: context.colors.mainText,
              ),
            ),

            Text(
              'Email@gmail.com',
              style: AppStyles.regular14(
                context: context,
              ).copyWithcolor: context.colors.secText,
              ),
            ),

            const SizedBox(height: 32),

            ActionCard(
              title: context.isDark
                  ? AppLocalizations.of(context)!.dark_mode
                  : AppLocalizations.of(context)!.light_mode,
              actionIcon: DirectionalIcon(child: ThemeLottieToggle()),
            ),
            const SizedBox(height: 16),
            ActionCard(
              title: AppLocalizations.of(context)!.language,
              actionIcon: InkWell(
                onTap: () {
                  openLanguageBottomSheet(context);
                },
                child: DirectionalIcon(
                  child: SvgPicture.asset(
                    icLanguagePath,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            ),
            const SizedBox(height: 16),
            ActionCard(
              title: AppLocalizations.of(context)!.profile_logout,
              actionIcon: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                child: DirectionalIcon(
                  child: SvgPicture.asset(
                    AppIcons.icLogout,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            ),
          ],
        ),
      ),
    );
  }
}

void openLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const LanguageBottomSheet(),
  );
}
