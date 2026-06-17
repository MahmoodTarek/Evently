import 'package:evently/ui/widgets/custom_text_button.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventDate extends StatelessWidget {
  final String prefixIcon;
  final String title;
  final String clickableText;
  final TextStyle clickableTextStyle;
  final VoidCallback? onIconTap;
  final Color? underlineColor;

  const EventDate({
    super.key,
    required this.prefixIcon,
    required this.title,
    required this.clickableText,
    this.onIconTap,
    required this.clickableTextStyle,
    this.underlineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          prefixIcon,
          colorFilter: ColorFilter.mode(
            context.colors.mainColor,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(title, style: AppStyles.medium16(context: context)),
        const Spacer(),
        CustomTextButton(
          text: clickableText,
          onPressed: onIconTap,
          textStyle: clickableTextStyle,
        ),
      ],
    );
  }
}
