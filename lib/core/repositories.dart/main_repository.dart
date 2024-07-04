import 'dart:developer';

import 'package:app_p_70/core/models/schedule/schedule.dart';
import 'package:app_p_70/core/models/training/training.dart';
import 'package:app_p_70/core/utils/app_strings.dart';
import 'package:app_p_70/core/utils/extensions.dart';
import 'package:app_p_70/presentation/clear_data_dialog/clear_data_dialog.dart';
import 'package:app_p_70/routes/app_routes.dart';
import 'package:app_p_70/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

class MainRepository {
  static final globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  static final scheduleBox = Hive.box<ScheduleModel>('schedule');
  static final trainingsBox = Hive.box<TrainingModel>('trainings');

  static ScheduleModel? get schedule => scheduleBox.values.firstOrNull;

  static bool get isTimerActive => scheduleBox.isNotEmpty;

  static bool checkForMissedTrainings()  {
    bool isTrainingMissed = false;
    final trainings = trainingsBox.values.toList();

    if (schedule != null && isTimerActive && trainings.isNotEmpty) {
      final DateTime now = DateTime.now().onlyDate;
      DateTime lastDate = trainingsBox.values.last.date.onlyDate;
      DateTime checkDate = lastDate.add(Duration(days: 1));

      while (checkDate.isBefore(now)) {
        final scheduledDays = schedule!.days.map((e) => e.index);
        if (scheduledDays.contains(lastDate.weekday)) {
          final missedTraining = TrainingModel(
            date: checkDate,
            isMissed: true,
          );
          addTraining(missedTraining);
          checkDate.add(Duration(days: 1));
          if (!isTrainingMissed) isTrainingMissed = true;
          continue;
        }
        break;
      }
    }
    return isTrainingMissed;
  }

  static void changeSchedule(ScheduleModel schedule) {
    scheduleBox
        .put(0, schedule)
        .onError((error, stackTrace) => showErrorSnackbar());
  }

  static void addTraining(TrainingModel training) {
    trainingsBox
        .add(training)
        .then((_) => showSuccessSnackbar(AppStrings.trainingSavedSuccessfully))
        .onError((error, stackTrace) => showErrorSnackbar());
  }

  static void clearCache(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (_) => const ClearDataDialog(),
    ).then(
      (value) async {
        if (value != null && value == AppStrings.delete) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.onboardingScreen,
            (route) => route.isFirst,
          );

          scheduleBox.clear();
          trainingsBox.clear();
        }
      },
    );
  }

  static Future<void> shareApp() async {
    try {
      Share.share(
        "https://appdynamiclink.page.link/76UZ",
        subject: 'Look what I found!',
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static void showSuccessSnackbar(String message) =>
      snackbarKey.currentState!.showSnackBar(CustomSnackBar.success(message));

  static void showErrorSnackbar() =>
      snackbarKey.currentState!.showSnackBar(CustomSnackBar.error());
}
