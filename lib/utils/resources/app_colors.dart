import 'dart:ui';

abstract class AppColors {
  Color get mainColor;
  Color get disable;
  Color get mainText;
  Color get secText;
  Color get background;
  Color get inputs;
  Color get stroke;
  Color get red;
}

class LightColors implements AppColors {
  @override
  Color get mainColor => const Color(0xff0E3A99);

  @override
  Color get disable => const Color(0xffB9B9B9);

  @override
  Color get mainText => const Color(0xff1C1C1C);

  @override
  Color get secText => const Color(0xff686868);

  @override
  Color get background => const Color(0xffF4F7FF);

  @override
  Color get inputs => const Color(0xffFFFFFF);

  @override
  Color get stroke => const Color(0xffF0F0F0);

  @override
  Color get red => const Color(0xffFF3232);
}

class DarkColors implements AppColors {
  @override
  Color get mainColor => const Color(0xff457AED);

  @override
  Color get disable => const Color(0xffB9B9B9);

  @override
  Color get mainText => const Color(0xffFFFFFF);

  @override
  Color get secText => const Color(0xffD6D6D6);

  @override
  Color get background => const Color(0xff000F30);

  @override
  Color get inputs => const Color(0xff001440);

  @override
  Color get stroke => const Color(0xff002D8F);

  @override
  Color get red => const Color(0xffFF0000);
}
