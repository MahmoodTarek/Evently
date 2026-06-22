import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @language_ar.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get language_ar;

  /// No description provided for @language_en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_en;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get dark_mode;

  /// No description provided for @light_mode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get light_mode;

  /// No description provided for @common_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get common_skip;

  /// No description provided for @common_start.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get common_start;

  /// No description provided for @common_get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get common_get_started;

  /// No description provided for @common_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get common_next;

  /// No description provided for @common_or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get common_or;

  /// No description provided for @onboarding_personalize_title.
  ///
  /// In en, this message translates to:
  /// **'Personalize Your Experience'**
  String get onboarding_personalize_title;

  /// No description provided for @onboarding_personalize_description.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'**
  String get onboarding_personalize_description;

  /// No description provided for @onboarding_discover_events_title.
  ///
  /// In en, this message translates to:
  /// **'Find Events That Inspire You'**
  String get onboarding_discover_events_title;

  /// No description provided for @onboarding_discover_events_description.
  ///
  /// In en, this message translates to:
  /// **'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'**
  String get onboarding_discover_events_description;

  /// No description provided for @onboarding_event_planning_title.
  ///
  /// In en, this message translates to:
  /// **'Effortless Event Planning'**
  String get onboarding_event_planning_title;

  /// No description provided for @onboarding_event_planning_description.
  ///
  /// In en, this message translates to:
  /// **'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'**
  String get onboarding_event_planning_description;

  /// No description provided for @onboarding_social_title.
  ///
  /// In en, this message translates to:
  /// **'Connect with Friends & Share Moments'**
  String get onboarding_social_title;

  /// No description provided for @onboarding_social_description.
  ///
  /// In en, this message translates to:
  /// **'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'**
  String get onboarding_social_description;

  /// No description provided for @auth_login_title.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get auth_login_title;

  /// No description provided for @auth_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get auth_email_hint;

  /// No description provided for @auth_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get auth_password_hint;

  /// No description provided for @auth_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get auth_forgot_password;

  /// No description provided for @auth_login_button.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_login_button;

  /// No description provided for @auth_no_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get auth_no_account;

  /// No description provided for @auth_signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get auth_signup;

  /// No description provided for @auth_google_login.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get auth_google_login;

  /// No description provided for @auth_signup_title.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get auth_signup_title;

  /// No description provided for @auth_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get auth_name_hint;

  /// No description provided for @auth_confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get auth_confirm_password_hint;

  /// No description provided for @auth_signup_button.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get auth_signup_button;

  /// No description provided for @auth_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get auth_have_account;

  /// No description provided for @auth_login_here.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_login_here;

  /// No description provided for @auth_google_signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up with Google'**
  String get auth_google_signup;

  /// No description provided for @auth_forgot_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get auth_forgot_password_title;

  /// No description provided for @auth_reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get auth_reset_password;

  /// No description provided for @home_welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back ✨'**
  String get home_welcome_back;

  /// No description provided for @language_short_en.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get language_short_en;

  /// No description provided for @language_short_ar.
  ///
  /// In en, this message translates to:
  /// **'AR'**
  String get language_short_ar;

  /// No description provided for @category_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get category_all;

  /// No description provided for @category_sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get category_sport;

  /// No description provided for @category_birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get category_birthday;

  /// No description provided for @category_book_club.
  ///
  /// In en, this message translates to:
  /// **'Book Club'**
  String get category_book_club;

  /// No description provided for @category_exhibition.
  ///
  /// In en, this message translates to:
  /// **'Exhibition'**
  String get category_exhibition;

  /// No description provided for @nav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get nav_home;

  /// No description provided for @nav_favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get nav_favorite;

  /// No description provided for @nav_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get nav_profile;

  /// No description provided for @search_event_hint.
  ///
  /// In en, this message translates to:
  /// **'Search for an event'**
  String get search_event_hint;

  /// No description provided for @profile_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profile_logout;

  /// No description provided for @event_title_label.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get event_title_label;

  /// No description provided for @event_title_hint.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get event_title_hint;

  /// No description provided for @event_description_label.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get event_description_label;

  /// No description provided for @event_description_hint.
  ///
  /// In en, this message translates to:
  /// **'Event Description...'**
  String get event_description_hint;

  /// No description provided for @event_date_label.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get event_date_label;

  /// No description provided for @event_date_hint.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get event_date_hint;

  /// No description provided for @event_time_label.
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get event_time_label;

  /// No description provided for @event_time_hint.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get event_time_hint;

  /// No description provided for @event_add_button.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get event_add_button;

  /// No description provided for @event_details_title.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get event_details_title;

  /// No description provided for @event_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get event_edit_title;

  /// No description provided for @event_update_button.
  ///
  /// In en, this message translates to:
  /// **'Update Event'**
  String get event_update_button;

  /// No description provided for @home_tab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_tab;

  /// No description provided for @favorite_tab.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorite_tab;

  /// No description provided for @profile_tab.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile_tab;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @current_language.
  ///
  /// In en, this message translates to:
  /// **'Current Language'**
  String get current_language;

  /// No description provided for @event_title_required_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter an event title'**
  String get event_title_required_error;

  /// No description provided for @event_title_length_error.
  ///
  /// In en, this message translates to:
  /// **'Title must be at least 3 characters'**
  String get event_title_length_error;

  /// No description provided for @event_title_max_length_error.
  ///
  /// In en, this message translates to:
  /// **'Title must not exceed 50 characters'**
  String get event_title_max_length_error;

  /// No description provided for @event_title_special_char_error.
  ///
  /// In en, this message translates to:
  /// **'Title contains invalid characters'**
  String get event_title_special_char_error;

  /// No description provided for @event_added_successfully.
  ///
  /// In en, this message translates to:
  /// **'Event added successfully'**
  String get event_added_successfully;

  /// No description provided for @no_events_title.
  ///
  /// In en, this message translates to:
  /// **'No Events Found'**
  String get no_events_title;

  /// No description provided for @no_events_description.
  ///
  /// In en, this message translates to:
  /// **'No events available. Please try again later or choose another category.'**
  String get no_events_description;

  /// No description provided for @no_favorites_title.
  ///
  /// In en, this message translates to:
  /// **'No Favorite Events'**
  String get no_favorites_title;

  /// No description provided for @no_favorites_description.
  ///
  /// In en, this message translates to:
  /// **'No favorite events available. Please try again later.'**
  String get no_favorites_description;

  /// No description provided for @email_required.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get email_required;

  /// No description provided for @email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get email_invalid;

  /// No description provided for @password_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get password_required;

  /// No description provided for @password_too_short.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get password_too_short;

  /// No description provided for @confirm_password_required.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirm_password_required;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @name_required.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get name_required;

  /// No description provided for @name_too_short.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters long'**
  String get name_too_short;

  /// No description provided for @name_too_long.
  ///
  /// In en, this message translates to:
  /// **'Name must not exceed 20 characters'**
  String get name_too_long;

  /// No description provided for @name_contains_numbers.
  ///
  /// In en, this message translates to:
  /// **'Name must not contain numbers'**
  String get name_contains_numbers;

  /// No description provided for @name_contains_special_characters.
  ///
  /// In en, this message translates to:
  /// **'Name must not contain special characters'**
  String get name_contains_special_characters;

  /// No description provided for @auth_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get auth_created_successfully;

  /// No description provided for @auth_failed_to_create_account.
  ///
  /// In en, this message translates to:
  /// **'Failed to create account'**
  String get auth_failed_to_create_account;

  /// No description provided for @auth_failed_to_login.
  ///
  /// In en, this message translates to:
  /// **'Failed to login'**
  String get auth_failed_to_login;

  /// No description provided for @auth_login_successfully.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get auth_login_successfully;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
