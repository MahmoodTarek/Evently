import 'package:evently/app_launch_service.dart';
import 'package:evently/data/onboarding_data_source.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/screens/on_boarding/widgets/onboarding_appbar.dart';
import 'package:evently/ui/screens/on_boarding/widgets/onboarding_page_view.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  static const _animationDuration = Duration(milliseconds: 300);

  final PageController _controller = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _controller.nextPage(duration: _animationDuration, curve: Curves.easeInOut);
  }

  void _goToPreviousPage() {
    _controller.previousPage(
      duration: _animationDuration,
      curve: Curves.easeInOut,
    );
  }

  void _skipToLastPage(int lastPageIndex) {
    _controller.animateToPage(
      lastPageIndex,
      duration: _animationDuration,
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pagesData = pages(context);

    final isLastPage = _currentPage == pagesData.length - 1;

    return Scaffold(
      appBar: OnboardingAppbar(
        currentPage: _currentPage,
        controller: _controller,
        pagesData: pagesData,
        goToPreviousPage: _goToPreviousPage,
        skipToLastPage: _skipToLastPage,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                itemCount: pagesData.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (_, index) {
                  final page = pagesData[index];

                  return OnboardingPageView(
                    controller: _controller,
                    totalPages: pagesData.length,
                    isFirstScreen: index == 0,
                    image: page.image,
                    title: page.title,
                    description: page.description,
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: context.colors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (isLastPage) {
                      AppLaunchService.setFirstLaunch();
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(AppRoutes.login);
                      return;
                    }

                    _goToNextPage();
                  },
                  child: Text(
                    isLastPage
                        ? AppLocalizations.of(context)!.common_get_started
                        : AppLocalizations.of(context)!.common_next,
                    style: AppStyles.medium20(context: context).copyWith(
                      color: context.isDark
                          ? context.colors.mainText
                          : context.colors.inputs,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
