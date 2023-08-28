// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Account`
  String get Account {
    return Intl.message(
      'Account',
      name: 'Account',
      desc: '',
      args: [],
    );
  }

  /// `App theme`
  String get AppTheme {
    return Intl.message(
      'App theme',
      name: 'AppTheme',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks`
  String get Bookmarks {
    return Intl.message(
      'Bookmarks',
      name: 'Bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get Abount {
    return Intl.message(
      'About',
      name: 'Abount',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message(
      'Light',
      name: 'Light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get SignIn {
    return Intl.message(
      'Sign In',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Or use social media`
  String get OrUseSocialMedial {
    return Intl.message(
      'Or use social media',
      name: 'OrUseSocialMedial',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get SignInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'SignInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get SignInWithApple {
    return Intl.message(
      'Sign in with Facebook',
      name: 'SignInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get DontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get ConfirmPasword {
    return Intl.message(
      'Confirm password',
      name: 'ConfirmPasword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get AlreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'AlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `The field cannot be empty`
  String get TheFieldCannotBeEmpty {
    return Intl.message(
      'The field cannot be empty',
      name: 'TheFieldCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Value must have a length greater than or equal to 8`
  String get ValueMustHaveALengthGreaterThanOrEqualTo8 {
    return Intl.message(
      'Value must have a length greater than or equal to 8',
      name: 'ValueMustHaveALengthGreaterThanOrEqualTo8',
      desc: '',
      args: [],
    );
  }

  /// `The value must be equal to the password`
  String get TheValueMustBeEqualToThePassword {
    return Intl.message(
      'The value must be equal to the password',
      name: 'TheValueMustBeEqualToThePassword',
      desc: '',
      args: [],
    );
  }

  /// `The field requires a valid email address`
  String get TheFieldRequiresAValidEmailAddress {
    return Intl.message(
      'The field requires a valid email address',
      name: 'TheFieldRequiresAValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Current version`
  String get Version {
    return Intl.message(
      'Current version',
      name: 'Version',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get Feedback {
    return Intl.message(
      'Feedback',
      name: 'Feedback',
      desc: '',
      args: [],
    );
  }

  /// `Email us`
  String get EmailUs {
    return Intl.message(
      'Email us',
      name: 'EmailUs',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `We Recommend`
  String get WeRecommend {
    return Intl.message(
      'We Recommend',
      name: 'WeRecommend',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Please search for a valid show name!`
  String get SearchForAValidShow {
    return Intl.message(
      'Please search for a valid show name!',
      name: 'SearchForAValidShow',
      desc: '',
      args: [],
    );
  }

  /// `Navigate to your profile page to update your picture`
  String get NavToProfileToUpdatePic {
    return Intl.message(
      'Navigate to your profile page to update your picture',
      name: 'NavToProfileToUpdatePic',
      desc: '',
      args: [],
    );
  }

  /// `Please sing in to be able to use this feature`
  String get SignInFirst {
    return Intl.message(
      'Please sing in to be able to use this feature',
      name: 'SignInFirst',
      desc: '',
      args: [],
    );
  }

  /// `There is not info about this show`
  String get NoInfoAboutShow {
    return Intl.message(
      'There is not info about this show',
      name: 'NoInfoAboutShow',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get SignOut {
    return Intl.message(
      'Sign out',
      name: 'SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Signed out`
  String get SignedOut {
    return Intl.message(
      'Signed out',
      name: 'SignedOut',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully. Enjoy!`
  String get RegisteredSuccessfullyEnjoy {
    return Intl.message(
      'Registered successfully. Enjoy!',
      name: 'RegisteredSuccessfullyEnjoy',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get ThePasswordProvidedIsTooWeak {
    return Intl.message(
      'The password provided is too weak.',
      name: 'ThePasswordProvidedIsTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get TheAccountAlreadyExistsForThatEmail {
    return Intl.message(
      'The account already exists for that email.',
      name: 'TheAccountAlreadyExistsForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get WrongPasswordProvidedForThatUser {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'WrongPasswordProvidedForThatUser',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get NoUserFoundForThatEmail {
    return Intl.message(
      'No user found for that email.',
      name: 'NoUserFoundForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `Signed in successfully. Enjoy!`
  String get SignedInSuccessfullyEnjoy {
    return Intl.message(
      'Signed in successfully. Enjoy!',
      name: 'SignedInSuccessfullyEnjoy',
      desc: '',
      args: [],
    );
  }

  /// `Already Signed In`
  String get AlreadySignedIn {
    return Intl.message(
      'Already Signed In',
      name: 'AlreadySignedIn',
      desc: '',
      args: [],
    );
  }

  /// `Add some favorites!`
  String get AddSomeFavorites {
    return Intl.message(
      'Add some favorites!',
      name: 'AddSomeFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to add profile picture`
  String get SignInToAddProfilePicture {
    return Intl.message(
      'Sign in to add profile picture',
      name: 'SignInToAddProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email first`
  String get EnterAValidEmailFirst {
    return Intl.message(
      'Enter a valid email first',
      name: 'EnterAValidEmailFirst',
      desc: '',
      args: [],
    );
  }

  /// `Check your email to set another password`
  String get CheckYourEmailToSetAnotherPassword {
    return Intl.message(
      'Check your email to set another password',
      name: 'CheckYourEmailToSetAnotherPassword',
      desc: '',
      args: [],
    );
  }

  /// `Share the app`
  String get ShareTheApp {
    return Intl.message(
      'Share the app',
      name: 'ShareTheApp',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
