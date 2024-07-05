import 'package:app_p_70/core/models/day_type/day_type.dart';
import 'package:app_p_70/core/models/training/training.dart';
import 'package:app_p_70/core/repositories.dart/main_repository.dart';
import 'package:app_p_70/presentation/home_screen/widgets/custom_painter.dart';
import 'package:app_p_70/presentation/home_screen/widgets/training_item_widget.dart';
import 'package:app_p_70/presentation/missed_workout_dialog/missed_workout_dialog.dart';
import 'package:app_p_70/presentation/onboarding_timer_screen/widgets/day_item_widget.dart';
import 'package:app_p_70/presentation/select_days_dialog/select_days_dialog.dart';
import 'package:app_p_70/presentation/start_training_dialog/start_training_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_70/core/app_export.dart';
import 'package:app_p_70/widgets/app_bar/appbar_title.dart';
import 'package:app_p_70/widgets/app_bar/appbar_trailing_image.dart';
import 'package:app_p_70/widgets/app_bar/custom_app_bar.dart';
import 'package:app_p_70/widgets/custom_elevated_button.dart';
import 'package:app_p_70/widgets/custom_icon_button.dart';
import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  DayType _selectedDayType = DayType.all;
  final List<DayType> _scheduledDays = MainRepository.schedule?.days ?? [];

  late AppLocalizations localizations;

  @override
  void initState() {
    bool isTrainingMissed = MainRepository.checkForMissedTrainings();
    if (isTrainingMissed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (isTrainingMissed)
          showDialog<String>(
            context: context,
            builder: (_) => const MissedWorkoutDialog(),
          );
      });
    }
    _scheduleTodayTrainingDialog();
    if (_scheduledDays.isNotEmpty && !_scheduledDays.contains(DayType.all))
      _scheduledDays.insert(0, DayType.all);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        appBar: _buildAppBar(),
        body: ValueListenableBuilder(
          valueListenable: MainRepository.trainingsBox.listenable(),
          builder: (context, box, child) {
            final trainings = box.values.toList();
            return _buildBody(trainings);
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: localizations.home.toUpperCase(),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgBasicSettings,
          margin: EdgeInsets.only(
            top: 17.v,
            right: 14.h,
            bottom: 17.v,
          ),
          onTap: () => Navigator.pushNamed(context, AppRoutes.settingsScreen),
        )
      ],
      styleType: Style.bgFill,
    );
  }

  Widget _buildTrainingSection(int balance) {
    final width = MediaQuery.sizeOf(context).width - 40;
    final height = (width * 0.7552631578947369).toDouble();

    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: RPSCustomPainter(),
          ),
          Column(
            children: [
              SizedBox(height: 14.v),
              CustomElevatedButton(
                text: localizations.trainingCredit,
                margin: EdgeInsets.symmetric(horizontal: 24.h),
              ),
              const Spacer(),
              Text(
                _formatTime(_seconds),
                style: theme.textTheme.displayLarge,
              ),
              const Spacer(),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${localizations.balance} $balance',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
            ],
          ),
          Positioned(
            right: 1,
            bottom: 1,
            child: CustomIconButton(
              onTap: _handleTimerTap,
              height: 74.h,
              width: 74.h,
              padding: EdgeInsets.all(16.h),
              decoration: MainRepository.isTimerActive
                  ? IconButtonStyleHelper.fillOnActive
                  : IconButtonStyleHelper.fillOnError,
              child: CustomImageView(
                imagePath: _isRunning
                    ? ImageConstant.imgPauseCircle
                    : ImageConstant.imgPlayCircle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(List<TrainingModel> trainings) {
    final balance = trainings
        .map((e) => e.points)
        .fold(0, (previous, element) => previous + element);

    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          _buildTrainingSection(balance),
          SizedBox(height: 24.v),
          _buildDayFilterPanel(),
          SizedBox(height: 10.v),
          Flexible(
            child: MainRepository.isTimerActive
                ? _buildTrainingList(trainings)
                : _noData(),
          )
        ],
      ),
    );
  }

  Widget _buildTrainingList(List<TrainingModel> trainings) {
    final filteredTrainings = trainings
        .where((e) =>
            (_selectedDayType == DayType.all) ||
            (e.date.weekday == _selectedDayType.index))
        .toList();

    return SizedBox(
      width: double.maxFinite,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.v,
          );
        },
        itemCount: filteredTrainings.length,
        itemBuilder: (context, index) {
          return TrainingItemWidget(
            training: filteredTrainings[index],
          );
        },
      ),
    );
  }

  SizedBox _noData() {
    return SizedBox(
      width: double.maxFinite,
      child: Text(
        localizations.chooseTheDaysForTraining,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: CustomTextStyles.bodyLarge18.copyWith(
          height: 1.56,
        ),
      ),
    );
  }

  Widget _buildDayFilterPanel() {
    return Container(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _scheduledDays.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.h),
        itemBuilder: (context, index) {
          final dayType = _scheduledDays[index];
          return DayTypeWidget(
            dayType: dayType,
            isSelected: _selectedDayType == dayType,
            onSelected: () {
              if (_selectedDayType != dayType) {
                setState(() => _selectedDayType = dayType);
              }
            },
          );
        },
      ),
    );
  }

  void _scheduleTodayTrainingDialog() {
    final Duration? delay = MainRepository.delayForTodayTrainingDialog();
    if (delay == null || delay.isNegative) return;
    Timer(
      delay,
      () {
        showDialog<String>(
          context: context,
          builder: (_) => StartTrainingDialog(
            onStartTraining: _handleTimerTap,
          ),
        );
      },
    );
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _resetTimer() {
    if (_seconds >= 60) {
      TrainingModel training = TrainingModel(
        date: DateTime.now(),
        duration: Duration(seconds: _seconds),
      );
      MainRepository.addTraining(training);
    } else {
      MainRepository.showTrainingWarningSnackbar();
    }

    _timer?.cancel();
    setState(() {
      _seconds = 0;
      _isRunning = false;
    });
  }

  void _handleTimerTap() {
    if (MainRepository.isTimerActive) {
      _isRunning ? _resetTimer() : _startTimer();
    } else
      showDialog<String>(
        context: context,
        builder: (_) => const SelectDaysDialog(),
      );
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
