import 'package:app_p_70/core/models/day_type/day_type.dart';
import 'package:app_p_70/core/models/duration/duration_adapter.dart';
import 'package:app_p_70/core/models/schedule/schedule.dart';
import 'package:app_p_70/core/models/training/training.dart';
import 'package:app_p_70/core/repositories.dart/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'core/app_export.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ThemeHelper().changeTheme('primary');

  await Hive.initFlutter();
  Hive.registerAdapter(ScheduleModelAdapter());
  Hive.registerAdapter(TrainingModelAdapter());
  Hive.registerAdapter(DayTypeAdapter());
  Hive.registerAdapter(DurationAdapter());

  await Hive.openBox<ScheduleModel>('schedule');
  await Hive.openBox<TrainingModel>('trainings');

  await NotificationPermissions.requestNotificationPermissions();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  FlutterNativeSplash.remove();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'app_p_70',
          debugShowCheckedModeBanner: false,
          initialRoute: MainRepository.isTimerActive
              ? AppRoutes.homeScreen
              : AppRoutes.onboardingScreen,
          routes: AppRoutes.routes,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
          ],
          scaffoldMessengerKey: MainRepository.snackbarKey,
          
        );
      },
    );
  }
}
