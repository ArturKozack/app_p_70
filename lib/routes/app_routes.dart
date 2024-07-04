import 'package:flutter/material.dart';
import 'package:app_p_70/presentation/home_screen/home_screen.dart';
import 'package:app_p_70/presentation/internet_screen/internet_screen.dart';
import 'package:app_p_70/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:app_p_70/presentation/onboarding_timer_screen/onboarding_timer_screen.dart';
import 'package:app_p_70/presentation/settings_screen/settings_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String onboardingTimerScreen = '/onboarding_timer_screen';

  static const String homeScreen = '/home_screen';

  static const String settingsScreen = '/settings_screen';

  static const String internetScreen = '/internet_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    onboardingScreen: (context) => OnboardingScreen(),
    onboardingTimerScreen: (context) => OnboardingTimerScreen(),
    homeScreen: (context) => HomeScreen(),
    settingsScreen: (context) => SettingsScreen(),
    internetScreen: (context) => InternetScreen(),
  };
}
