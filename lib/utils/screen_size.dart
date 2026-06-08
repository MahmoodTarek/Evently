import 'package:flutter/widgets.dart';

extension ScreenSize on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get height => screenSize.height;

  double get width => screenSize.width;

  double heightFactor(double factor) => height * factor;

  double widthFactor(double factor) => width * factor;
}
