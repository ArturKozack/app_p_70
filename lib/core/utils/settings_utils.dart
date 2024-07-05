import 'package:app_p_70/core/repositories.dart/main_repository.dart';
import 'package:app_p_70/presentation/settings_screen/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case SettingsItemType.notifications:
        return localizations.notification;
      case SettingsItemType.privacyPolicy:
        return localizations.privacyPolicy;
      case SettingsItemType.shareApp:
        return localizations.shareApp;
      case SettingsItemType.termsOfUse:
        return localizations.termsOfUse;
      case SettingsItemType.clearCache:
        return localizations.clearData;
    }
  }

  String get description {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case SettingsItemType.privacyPolicy:
        return localizations.loremIpsum;
      case SettingsItemType.termsOfUse:
        return localizations.loremIpsum;
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
