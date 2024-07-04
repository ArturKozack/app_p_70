import 'package:flutter/material.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/internet_screen/internet_screen.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/onboarding_timer_screen/onboarding_timer_screen.dart';
import '../presentation/preloader_screen/preloader_screen.dart';
import '../presentation/settings_screen/settings_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String onboardingTimerScreen = '/onboarding_timer_screen';

  static const String preloaderScreen = '/preloader_screen';

  static const String homeScreen = '/home_screen';

  static const String settingsScreen = '/settings_screen';

  static const String internetScreen = '/internet_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    onboardingScreen: (context) => OnboardingScreen(),
    onboardingTimerScreen: (context) => OnboardingTimerScreen(),
    homeScreen: (context) => HomeScreen(),
    settingsScreen: (context) => SettingsScreen(),
    internetScreen: (context) => InternetScreen(),
    initialRoute: (context) => PreloaderScreen()
  };
}
