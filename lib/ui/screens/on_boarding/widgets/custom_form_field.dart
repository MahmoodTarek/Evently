import 'package:evently/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnChanged = void Function(String value)?;
typedef Validator = String? Function(String? value)?;

class CustomFormField extends StatefulWidget {
  final int? maxLines;
  final Color? cursorColor;
  final OnChanged? onChanged;
  final Validator? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? textColor;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? icHidePassword;
  final String? icShowPassword;
  final double? height;

  const CustomFormField({
    super.key,
    this.maxLines = 1,
    this.cursorColor,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.textColor,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.icHidePassword,
    this.icShowPassword,
    this.height,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool isHiddenPassword;

  @override
  void initState() {
    super.initState();
    isHiddenPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        obscureText: widget.isPassword && isHiddenPassword,
        keyboardType: widget.keyboardType,
        autovalidateMode: AutovalidateMode.onUnfocus,
        controller: widget.controller,
        style: TextStyle(color: widget.textColor ?? context.colors.mainText),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isHiddenPassword = !isHiddenPassword;
                    });
                  },
                  icon:
                      (widget.icHidePassword != null &&
                          widget.icShowPassword != null)
                      ? SvgPicture.asset(
                          isHiddenPassword
                              ? widget.icShowPassword!
                              : widget.icHidePassword!,
                        )
                      : Icon(
                          isHiddenPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: context.colors.mainColor,
                        ),
                )
              : widget.suffixIcon,

          hintText: widget.hintText,

          hintStyle: widget.hintStyle,

          filled: true,
          fillColor: context.colors.inputs,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: context.colors.mainColor, width: 2),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
        maxLines: widget.maxLines,
        cursorColor: widget.cursorColor,
      ),
    );
  }
}
