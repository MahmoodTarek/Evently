import 'package:evently/data/firebase_utils/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/category.dart';
import 'package:evently/model/event.dart';
import 'package:evently/provider/categories_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/event_card.dart';
import 'package:evently/ui/screens/add_event/widgets/event_date.dart';
import 'package:evently/ui/screens/on_boarding/widgets/custom_form_field.dart';
import 'package:evently/ui/widgets/custom_app_bar.dart';
import 'package:evently/ui/widgets/custom_elevated_button.dart';
import 'package:evently/ui/widgets/custom_selected_items_row.dart';
import 'package:evently/utils/app_pickers.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/formated_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:evently/utils/resources/app_validator.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Event? currentEvent;

  DateTime? selectedDate;
  String? selectedCategory;
  String? selectedCategoryImage;
  String? selectedTime;

  bool isInitialized = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void initializeData() {
    if (isInitialized) return;

    currentEvent = ModalRoute.of(context)!.settings.arguments as Event;

    _titleController.text = currentEvent!.title;
    _descriptionController.text = currentEvent!.description;

    selectedDate = currentEvent!.date;
    selectedCategory = currentEvent!.category;
    selectedTime = currentEvent!.time;
    selectedCategoryImage = eventCategoryImage(currentEvent!.category, context);

    isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    initializeData();

    final double height = context.height;
    final double width = context.width;

    final localization = AppLocalizations.of(context)!;

    List<Category> categories = CategoriesProvider.categories;

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
                        image: AssetImage(selectedCategoryImage!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                CustomSelectedItemsRow(
                  initialValue: selectedCategory!,
                  optionsTitle: categories.map((e) => e.name).toList(),
                  optionsIcon: categories.map((e) => e.image).toList(),
                  labelBuilder: (String item) => item,
                  onSelected: (String item) {
                    setState(() {
                      selectedCategory = item;
                      selectedCategoryImage = eventCategoryImage(item, context);
                    });
                  },
                ),

                SizedBox(height: height * .02),

                paddingOrientational(
                  child: Text(
                    localization.event_title_label,
                    style: AppStyles.medium16(context: context),
                  ),
                ),

                SizedBox(height: height * .01),

                paddingOrientational(
                  child: CustomFormField(
                    controller: _titleController,
                    validator: (value) {
                      return AppValidator.validateTitle(
                        context: context,
                        value: value,
                      );
                    },
                    hintText: localization.event_title_hint,
                    hintStyle: AppStyles.regular14(
                      context: context,
                    ).copyWith(color: context.colors.secText),
                  ),
                ),

                SizedBox(height: height * .02),

                paddingOrientational(
                  child: Text(
                    localization.event_description_label,
                    style: AppStyles.medium16(context: context),
                  ),
                ),

                SizedBox(height: height * .02),

                paddingOrientational(
                  child: CustomFormField(
                    controller: _descriptionController,
                    hintText: localization.event_description_label,
                    hintStyle: AppStyles.regular14(
                      context: context,
                    ).copyWith(color: context.colors.secText),
                    maxLines: 5,
                  ),
                ),

                SizedBox(height: height * .02),

                paddingOrientational(
                  child: EventDate(
                    underlineColor: context.colors.mainColor,

                    prefixIcon: AppIcons.icDate,
                    title: localization.event_date_label,
                    clickableText: selectedDate!.formatedToDayAndMon(),
                    clickableTextStyle: AppStyles.regular14(context: context),
                    onIconTap: () async {
                      final pickedDate = await AppPickers.onChooseDate(
                        context: context,
                        selectedDate: selectedDate,
                      );

                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                ),

                paddingOrientational(
                  vertical: height * .02,
                  child: EventDate(
                    underlineColor: context.colors.mainColor,
                    onIconTap: () async {
                      final picked = await AppPickers.onChooseTime(
                        context: context,
                        selectedTime: null,
                      );

                      if (picked == null) return;

                      setState(() {
                        selectedTime =
                            "${picked.hour} : ${picked.minute}  ${picked.period.name.toUpperCase()}";
                      });
                    },

                    prefixIcon: AppIcons.icTime,
                    title: localization.event_time_label,
                    clickableText: selectedTime!,
                    clickableTextStyle: AppStyles.regular14(context: context),
                  ),
                ),

                SizedBox(height: height * .02),

                paddingOrientational(
                  child: CustomElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;

                      final userID = Provider.of<UserProvider>(
                        context,
                        listen: false,
                      ).currentUser!.id;

                      try {
                        await onAddEventButtonClicked(
                          uId: userID,
                          title: _titleController.text.trim(),
                          description: _descriptionController.text.trim(),
                          selectedDate: selectedDate!,
                          selectedTime: selectedTime!,
                          selectedCategory: selectedCategory!,
                        );

                        if (!mounted) return;

                        Navigator.pop(context, true);
                      } catch (e) {
                        if (!mounted) return;
                      }
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

  Future<void> onAddEventButtonClicked({
    required String uId,
    required String title,
    required String description,
    required DateTime selectedDate,
    required String selectedTime,
    required String selectedCategory,
  }) async {
    if (!_formKey.currentState!.validate()) return;

    final event = Event(
      id: currentEvent!.id,
      title: title,
      description: description,
      date: selectedDate,
      time: selectedTime,
      category: selectedCategory,
      imageUrl: selectedCategoryImage!,
      isFavorite: currentEvent!.isFavorite,
    );

    await FirebaseUtils.updateEvent(event: event, uId: uId);
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
