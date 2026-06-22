import 'package:evently/data/firebase_utils/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/provider/categories_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/ui/screens/add_event/widgets/event_date.dart';
import 'package:evently/ui/screens/on_boarding/widgets/custom_form_field.dart';
import 'package:evently/ui/widgets/custom_app_bar.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_selected_items_row.dart';
import 'package:evently/ui/widgets/toast_message.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/formated_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:evently/utils/resources/app_validator.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  String selectedCategory = CategoryType.sports.name;
  String title = '';
  String description = '';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String formatedDate = '';
  String formattedTime = '';
  bool isDateValid = true;
  bool isTimeValid = true;
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedCategoryImage;
  CategoriesProvider? categoriesProvider;
  EventsProvider? eventsProvider;

  List<String> lightCategoriesImages = [
    AppImages.imgLightCategorySport,
    AppImages.imgLightCategoryBirthday,
    AppImages.imgLightCategoryBookClub,
    AppImages.imgLightCategoryExhibition,
  ];

  List<String> darkCategoriesImages = [
    AppImages.imgDarkCategorySport,
    AppImages.imgDarkCategoryBirthday,
    AppImages.imgDarkCategoryBookClub,
    AppImages.imgDarkCategoryExhibition,
  ];

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      setState(() {
        title = titleController.text;
      });
    });
    descriptionController.addListener(() {
      setState(() {
        description = descriptionController.text;
      });
    });

    categoriesProvider = Provider.of<CategoriesProvider>(
      context,
      listen: false,
    );
    eventsProvider = Provider.of<EventsProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eventsProvider?.getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = context.height;
    final double width = context.width;

    selectedCategoryImage = context.isDark
        ? darkCategoriesImages[selectedIndex]
        : lightCategoriesImages[selectedIndex];

    final categories = CategoriesProvider.categories;

    final dateTextColor = isDateValid ? context.colors.mainColor : Colors.red;

    final timeTextColor = isTimeValid ? context.colors.mainColor : Colors.red;

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
                        image: AssetImage(selectedCategoryImage!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                CustomSelectedItemsRow(
                  initialValue: selectedCategory,
                  optionsTitle: categories.map((e) => e.name).toList(),
                  optionsIcon: categories.map((e) => e.image).toList(),
                  labelBuilder: (item) => item,
                  onSelected: (item) {
                    final selectedCategoryItem = categories.firstWhere(
                      (category) => category.name == item,
                    );

                    setState(() {
                      selectedCategory = selectedCategoryItem.name;
                      selectedIndex = categories.indexOf(selectedCategoryItem);
                    });
                  },
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
                    controller: titleController,
                    validator: (value) {
                      return AppValidator.validateTitle(
                        value: value,
                        context: context,
                      );
                    },
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
                    hintText: localization.event_description_hint,
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
                    clickableText: selectedDate != null
                        ? formatedDate
                        : localization.event_date_hint,
                    onIconTap: onChooseDate,
                    clickableTextStyle: AppStyles.regular14(context: context)
                        .copyWith(
                          color: dateTextColor,
                          decorationColor: dateTextColor,
                        ),
                  ),
                ),

                paddingOrientational(
                  vertical: height * .02,
                  child: EventDate(
                    prefixIcon: AppIcons.icTime,
                    title: localization.event_time_label,
                    clickableText: selectedTime != null
                        ? formattedTime
                        : localization.event_time_hint,

                    onIconTap: onChooseTime,
                    clickableTextStyle: AppStyles.regular14(context: context)
                        .copyWith(
                          color: timeTextColor,
                          decorationColor: timeTextColor,
                        ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                paddingOrientational(
                  child: CustomElevatedButton(
                    onPressed: () {
                      setState(() {
                        isDateValid = selectedDate != null;
                        isTimeValid = selectedTime != null;
                      });

                      if (selectedDate == null || selectedTime == null) {
                        return;
                      }

                      onAddEventButtonClicked(
                        title: title,
                        description: description,
                        selectedDate: selectedDate!,
                        selectedTime: selectedTime!.format(context),
                        selectedCategory: selectedCategory,
                      );
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

  void onAddEventButtonClicked({
    required String title,
    required String description,
    required DateTime selectedDate,
    required String selectedTime,
    required String selectedCategory,
  }) async {
    if (!_formKey.currentState!.validate()) return;
    if (selectedDate.toString().isEmpty) {
      setState(() {
        isDateValid = false;
      });
      return;
    }
    if (selectedTime.isEmpty) {
      setState(() {
        isTimeValid = false;
      });
      return;
    }

    final event = Event(
      title: title,
      description: description,
      date: selectedDate,
      time: selectedTime,
      category: selectedCategory,
      imageUrl: selectedCategoryImage!,
      isFavorite: false,
    );

    await FirebaseUtils.addEvent(event: event).timeout(
      Duration(),
      onTimeout: () {
        Navigator.pop(context);
        ToastMessage.show(
          context: context,
          message: AppLocalizations.of(context)!.event_added_successfully,
        );
      },
    );
  }

  Future<void> onChooseDate() async {
    final picked = await showDatePicker(
      context: context,
      locale: Locale(Localizations.localeOf(context).languageCode),
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme(
              brightness: isDark ? Brightness.dark : Brightness.light,

              primary: context.colors.mainColor,
              onPrimary: Colors.white,

              secondary: context.colors.mainColor,
              onSecondary: Colors.white,

              error: Colors.red,
              onError: Colors.white,

              surface: context.colors.background,
              onSurface: context.colors.mainText,
            ),
            dialogTheme: DialogThemeData(
              backgroundColor: context.colors.background,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked == null) return;

    setState(() {
      selectedDate = picked;

      isDateValid = true;

      formatedDate = picked.formatedToDayAndMon();
    });
  }

  Future<void> onChooseTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme(
              brightness: isDark ? Brightness.dark : Brightness.light,

              primary: context.colors.mainColor,
              onPrimary: Colors.white,

              secondary: context.colors.mainColor,
              onSecondary: Colors.white,

              error: Colors.red,
              onError: Colors.white,

              surface: context.colors.background,
              onSurface: context.colors.mainText,
            ),
            dialogTheme: DialogThemeData(
              backgroundColor: context.colors.background,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked == null) return;

    setState(() {
      selectedTime = picked;
      formattedTime = picked.format(context);
      isTimeValid = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();

    eventsProvider?.getEvents(category: categoriesProvider!.selectedCategory);
  }
}
