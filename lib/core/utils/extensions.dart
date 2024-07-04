import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_70/core/models/day_type/day_type.dart';
import 'package:app_p_70/core/repositories.dart/main_repository.dart';

extension StringExtension on String {
  String get capitalized {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension DayTypeExtension on DayType {
  String get title {
    final context = MainRepository.snackbarKey.currentContext!;
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case DayType.all:
        return localizations.all;
      case DayType.monday:
        return localizations.monday;
      case DayType.tuesday:
        return localizations.tuesday;
      case DayType.wednesday:
        return localizations.wednesday;
      case DayType.thursday:
        return localizations.thursday;
      case DayType.friday:
        return localizations.friday;
      case DayType.saturday:
        return localizations.saturday;
      case DayType.sunday:
        return localizations.sunday;
    }
  }
}
