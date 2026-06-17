import 'package:evently/data/categories.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/category.dart';
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

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  String selectedCategoryImage = AppImages.imgDarkCategorySport;
  String selectedCategory = 'Book Club';
  String title = 'Reading book club ';
  String description =
      'Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis  feugiat.';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = title;
    _descriptionController.text = description;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = context.height;
    final double width = context.width;
    final localization = AppLocalizations.of(context)!;
    List<Category> categoriesList = categories(context).skip(1).toList();

    return Scaffold(
      appBar: CustomAppBar(
        title: localization.event_edit_title,
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
          child: Form(
            key: _formKey,
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
                        image: AssetImage(selectedCategoryImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                CustomSelectedItemsRow(
                  initialValue: selectedCategory,
                  optionsTitle: categoriesList.map((e) => e.name).toList(),
                  optionsIcon: categoriesList.map((e) => e.image).toList(),
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
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    /*Note: Add Validation*/
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
                    controller: _descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    /*Note: Add Validation*/
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
                    clickableText: 'February 22, 2002',
                    clickableTextStyle: AppStyles.regular14(context: context),
                  ),
                ),

                paddingOrientational(
                  vertical: height * .02,
                  child: EventDate(
                    prefixIcon: AppIcons.icTime,
                    title: localization.event_time_label,
                    clickableText: '01:00 AM',
                      clickableTextStyle: AppStyles.regular14(context: context)
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
                      localization.event_update_button,
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
