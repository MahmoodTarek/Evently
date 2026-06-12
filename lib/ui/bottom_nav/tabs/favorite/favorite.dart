import 'package:evently/data/categories.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/event_card.dart';
import 'package:evently/ui/screens/on_boarding/widgets/custom_form_field.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            CustomFormField(
              hintText: AppLocalizations.of(context)!.search_event_hint,
              hintStyle: AppStyles.regular14(
                context: context,
              ).copyWith(color: context.colors.mainText),
              keyboardType: TextInputType.text,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppIcons.icSearch,
                  colorFilter: ColorFilter.mode(
                    context.colors.mainColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 24),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: EventCard(
                  category: categories(context).first.name,
                  backgroundImage: AppImages.imgLightCategoryBirthday,
                  title: 'This is a Birthday Party ',
                  date: '21 Jan',
                  isFavorite: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
