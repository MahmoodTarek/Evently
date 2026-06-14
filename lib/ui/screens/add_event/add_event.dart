import 'package:evently/data/categories.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/screens/add_event/widgets/event_date.dart';
import 'package:evently/ui/screens/on_boarding/widgets/custom_form_field.dart';
import 'package:evently/ui/widgets/custom_app_bar.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_selected_items_row.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late final double height;
  late final double width;

  String selectedCategory = '';
  String title = '';
  String description = '';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    height = context.height;
    width = context.width;
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        title: localization.event_add_button,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            context.isDark ? AppIcons.icBackDark : AppIcons.icBackLight,
          ),
        ),
      ),

      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddingOrientational(
                vertical: height * .02,
                horizontal: width * .02,
                child: Container(
                  height: height * .30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(AppImages.imgDarkCategoryBirthday),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              CustomSelectedItemsRow(
                initialValue: categories(context).first.name,
                optionsTitle: categories(context).map((e) => e.name).toList(),
                optionsIcon: categories(context).map((e) => e.image).toList(),
                labelBuilder: (String item) => item,
                onSelected: (String item) => print(item),
              ),

              SizedBox(height: height * 0.02),

              paddingOrientational(
                child: Text(
                  AppLocalizations.of(context)!.event_title_label,
                  style: AppStyles.medium16(context: context),
                ),
              ),

              SizedBox(height: height * 0.01),
              paddingOrientational(
                child: CustomFormField(
                  hintText: AppLocalizations.of(context)?.event_title_hint,
                  hintStyle: AppStyles.regular14(
                    context: context,
                  ).copyWith(color: context.colors.secText),
                ),
              ),

              SizedBox(height: height * 0.02),
              paddingOrientational(
                child: Text(
                  localization.event_description_label,
                  style: AppStyles.medium16(context: context),
                ),
              ),

              SizedBox(height: height * 0.02),

              paddingOrientational(
                child: CustomFormField(
                  hintText: localization.event_title_label,
                  hintStyle: AppStyles.regular14(
                    context: context,
                  ).copyWith(color: context.colors.secText),
                  maxLines: 5,
                ),
              ),
              SizedBox(height: height * 0.02),

              paddingOrientational(
                child: EventDate(
                  prefixIcon: AppIcons.icDate,
                  title: localization.event_date_label,
                  clickableText: localization.event_date_hint,
                ),
              ),

              paddingOrientational(
                vertical: height * .02,
                child: EventDate(
                  prefixIcon: AppIcons.icTime,
                  title: localization.event_time_label,
                  clickableText: localization.event_time_hint,
                ),
              ),

              SizedBox(height: height * 0.02),

              paddingOrientational(
                child: CustomElevatedButton(
                  onPressed: () {
                    /*TODO: Add Event Button*/
                  },
                  backgroundColor: context.colors.mainColor,
                  child: Text(
                    localization.event_add_button,
                    style: AppStyles.medium20(
                      context: context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paddingOrientational({
    required Widget child,
    double horizontal = 16,
    double vertical = 0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: child,
    );
  }
}
