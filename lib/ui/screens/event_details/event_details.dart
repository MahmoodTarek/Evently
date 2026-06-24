import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/event_card.dart';
import 'package:evently/ui/widgets/custom_app_bar.dart';
import 'package:evently/ui/widgets/custom_item_card.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final height = context.height;
    final width = context.width;
    final currentEvent = ModalRoute
        .of(context)!
        .settings
        .arguments as Event;
    final categoryImage = eventCategoryImage(currentEvent.category, context);


    return Scaffold(
      appBar: CustomAppBar(
        title: localization.event_details_title,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            context.isDark ? AppIcons.icBackDark : AppIcons.icBackLight,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, AppRoutes.editEvent, arguments: currentEvent);
            },
            iconSize: height * 0.04,
            icon: CustomItemCard(
              height: height * 0.04,
              width: width * 0.08,
              borderRadius: 10,
              backgroundColor: context.colors.inputs,
              child: SvgPicture.asset(
                AppIcons.icEdit,
                colorFilter: ColorFilter.mode(
                  context.colors.mainColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),

        ],
      ),

      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * .3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(categoryImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              SizedBox(height: height * .02),

              Text(
                currentEvent.title,
                style: AppStyles.medium18(
                  context: context,
                ).copyWith(color: context.colors.mainText),
              ),

              /*Todo: Add Event Title*/
              SizedBox(height: height * 0.02),

              CustomItemCard(
                backgroundColor: context.colors.inputs,
                height: height * .08,
                borderColor: context.colors.stroke,
                padding: EdgeInsets.symmetric(
                  horizontal: width * .02,
                  vertical: height * .01,
                ),
                child: Row(
                  children: [
                    CustomItemCard(
                      height: height * 0.12,
                      width: width * 0.12,
                      borderRadius: 10,
                      backgroundColor: context.colors.inputs,
                      borderColor: context.colors.stroke,
                      padding: const EdgeInsetsGeometry.all(10),
                      child: SvgPicture.asset(
                        AppIcons.icDate,
                        width: height * .04,
                        height: width * .04,
                        colorFilter: ColorFilter.mode(
                          context.colors.mainColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),

                    SizedBox(width: width * 0.02),

                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '21 January',
                          style: AppStyles.medium16(
                            context: context,
                          ).copyWith(color: context.colors.mainColor),
                        ) /*Todo: Add Date*/,
                        Text(
                          '12:12 AM',
                          style: AppStyles.medium16(
                            context: context,
                          ).copyWith(color: context.colors.mainText),
                        ) /*Todo: Add Time*/,
                      ],
                    ),
                  ],
                ),
              ),

              if (currentEvent.description.isNotEmpty) ...[
                SizedBox(height: height * 0.02),
                Text(
                  localization.event_description_label,
                  style: AppStyles.medium18(context: context),
                ),
                SizedBox(height: height * 0.02),

                CustomItemCard(
                  padding: EdgeInsets.all(width * 0.028),
                  backgroundColor: context.colors.inputs,
                  child: Text(
                    currentEvent.description,
                    style: AppStyles.regular14(
                      context: context,
                    ).copyWith(color: context.colors.mainText),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
