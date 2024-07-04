import 'package:app_p_70/core/utils/app_strings.dart';
import 'package:app_p_70/core/repositories.dart/main_repository.dart';
import 'package:app_p_70/presentation/settings_screen/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

enum SettingsItemType {
  notifications,
  privacyPolicy,
  shareApp,
  termsOfUse,
  clearCache,
}

extension SettingsItemValue on SettingsItemType {
  String get title {
    switch (this) {
      case SettingsItemType.notifications:
        return 'Notifications';
      case SettingsItemType.privacyPolicy:
        return 'Privacy Policy';
      case SettingsItemType.shareApp:
        return 'Share app';
      case SettingsItemType.termsOfUse:
        return 'Terms of Use';
      case SettingsItemType.clearCache:
        return 'Clear data';
    }
  }

  String get description {
    switch (this) {
      case SettingsItemType.privacyPolicy:
        return AppStrings.loremIpsum;
      case SettingsItemType.termsOfUse:
        return AppStrings.loremIpsum;
      default:
        return '';
    }
  }

  void onTap(BuildContext context) {
    switch (this) {
      case SettingsItemType.notifications:
        openAppSettings();
        break;
      case SettingsItemType.shareApp:
        MainRepository.shareApp();
        break;
      case SettingsItemType.clearCache:
        MainRepository.clearCache(context);
        break;
      default:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => InfoScreen(this),
          ),
        );
    }
  }
}
