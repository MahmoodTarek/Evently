import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/ui/bottom_nav/tabs/favorite/favorite.dart';
import 'package:evently/ui/bottom_nav/tabs/home/home.dart';
import 'package:evently/ui/bottom_nav/tabs/profile/profile.dart';
import 'package:evently/ui/widgets/custom_fab.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../utils/resources/app_assets.dart';
import '../../utils/resources/app_styles.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  late final NotchBottomBarController _controller;

  final List<Widget> tabs = const [Home(), Favorite(), Profile()];

  @override
  void initState() {
    super.initState();
    _controller = NotchBottomBarController(index: currentIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLanguage = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final themeProvider = context.watch<ThemeProvider>();
    final bool isDark = themeProvider.currentTheme == ThemeMode.dark;

    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeInOutBack,
          child: tabs[currentIndex],
        ),
      ),
      floatingActionButton: CustomFAB(
        backgroundColor: context.colors.mainColor,
        elevation: 10,
        radius: 50,
        radiusColor: context.colors.mainColor,
        onPressed: () {},
        child: SvgPicture.asset(AppIcons.icAdd),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        notchBottomBarController: _controller,
        itemLabelStyle: AppStyles.bottomNavigationBar(context),
        bottomBarItems: _buildItems(appLanguage, isDark),
        kIconSize: 24,
        kBottomRadius: 32,
        bottomBarHeight: 56,
        bottomBarWidth: MediaQuery.of(context).size.width,
        elevation: 8,
        shadowElevation: 2,
        textAlign: TextAlign.center,
        color: theme.scaffoldBackgroundColor,
        notchColor: theme.scaffoldBackgroundColor,
      ),
    );
  }

  List<BottomBarItem> _buildItems(AppLocalizations appLanguage, bool isDark) {
    return [
      _navItem(
        label: appLanguage.home_tab,
        inactive: AppIcons.unselectedHome,
        active: isDark ? AppIcons.selectedHomeDark : AppIcons.selectedHome,
      ),
      _navItem(
        label: appLanguage.favorite_tab,
        inactive: AppIcons.unselectedFavorite,
        active: isDark
            ? AppIcons.selectedFavoriteDark
            : AppIcons.selectedFavorite,
      ),
      _navItem(
        label: appLanguage.profile_tab,
        inactive: AppIcons.unselectedProfile,
        active: isDark
            ? AppIcons.selectedProfileDark
            : AppIcons.selectedProfile,
      ),
    ];
  }

  BottomBarItem _navItem({
    required String label,
    required String inactive,
    required String active,
  }) {
    return BottomBarItem(
      itemLabel: label,
      inActiveItem: SvgPicture.asset(inactive),
      activeItem: SvgPicture.asset(active),
    );
  }
}
