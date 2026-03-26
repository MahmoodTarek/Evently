import 'package:evently/provider/theme_provider.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ThemeLottieToggle extends StatefulWidget {
  const ThemeLottieToggle({super.key});

  @override
  State<ThemeLottieToggle> createState() => _ThemeLottieToggleState();
}

class _ThemeLottieToggleState extends State<ThemeLottieToggle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: () {
        final isDark = themeProvider.currentTheme == ThemeMode.dark;

        if (isDark) {
          _controller.animateTo(
            0.0,
            duration: const Duration(milliseconds: 400),
          );
        } else {
          _controller.animateTo(
            0.5,
            duration: const Duration(milliseconds: 400),
          );
        }

        themeProvider.toggleTheme(
          newThemeMode: isDark ? ThemeMode.light : ThemeMode.dark,
        );
      },
      child: SizedBox(
        width: 80,
        height: 48,
        child: Lottie.asset(
          AppIcons.themeMode,
          controller: _controller,
          onLoaded: (composition) {
            _controller.duration = composition.duration;
            final isDark =
                context.read<ThemeProvider>().currentTheme == ThemeMode.dark;
            _controller.value = isDark ? 0.5 : 0.0;
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
