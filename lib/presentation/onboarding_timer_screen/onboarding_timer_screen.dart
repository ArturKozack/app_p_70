import 'package:app_p_70/core/models/day_type/day_type.dart';
import 'package:app_p_70/core/models/schedule/schedule.dart';
import 'package:app_p_70/core/repositories.dart/main_repository.dart';
import 'package:app_p_70/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_p_70/core/app_export.dart';
import 'package:app_p_70/widgets/app_bar/appbar_subtitle.dart';
import 'package:app_p_70/widgets/app_bar/custom_app_bar.dart';
import 'widgets/day_item_widget.dart';

class OnboardingTimerScreen extends StatefulWidget {
  const OnboardingTimerScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingTimerScreen> createState() => _OnboardingTimerScreenState();
}

class _OnboardingTimerScreenState extends State<OnboardingTimerScreen> {
  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();

  final List<DayType> _selectedDays = [];
  TimeOfDay _selectedTime = TimeOfDay(hour: 0, minute: 0);

  late AppLocalizations localizations;

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        appBar: _buildAppbarSection(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 30.v,
          ),
          child: Column(
            children: [
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbarSection(BuildContext context) {
    return CustomAppBar(
      height: 90.v,
      actions: [
        AppbarSubtitle(
          text: localizations.skip,
          margin: EdgeInsets.only(
            top: 18.v,
            right: 36.h,
            bottom: 19.v,
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            localizations.trainingCredit,
            style: theme.textTheme.displaySmall,
          ),
          SizedBox(height: 50.v),
          SizedBox(
            width: double.maxFinite,
            child: Text(
              localizations.chooseYourDaysForSports,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.headlineSmallPrimaryContainer.copyWith(
                height: 1.06,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          SizedBox(
            width: double.maxFinite,
            child: Wrap(
              runSpacing: 10.v,
              spacing: 10.h,
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                DayType.values.length,
                (index) {
                  final dayType = DayType.values[index];
                  return DayTypeWidget(
                    dayType: dayType,
                    isSelected: _selectedDays.contains(dayType),
                    onSelected: () {
                      setState(
                        () {
                          if (_selectedDays.contains(dayType)) {
                            _selectedDays.remove(dayType);
                          } else {
                            if (dayType == DayType.all ||
                                _selectedDays.contains(DayType.all)) {
                              _selectedDays.clear();
                            }
                            _selectedDays.add(dayType);
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 34.v),
          SizedBox(
            width: double.maxFinite,
            child: Text(
              localizations.chooseTimeToDoSports,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.headlineSmallPrimaryContainer.copyWith(
                height: 1.06,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          _buildTimeInputWidget(),
          Spacer(),
          AppButton(
            title: localizations.next,
            isActive: _selectedDays.isNotEmpty,
            onTap: () {
              if (_selectedDays.isNotEmpty) {
                if (_selectedDays.contains(DayType.all)) {
                  _selectedDays.clear();
                  _selectedDays.addAll(DayType.values);
                } else {
                  _selectedDays.sort((a, b) => a.index.compareTo(b.index));
                }
                final now = DateTime.now();
                final schedule = ScheduleModel(
                  days: _selectedDays,
                  startDate: DateTime(
                    now.year,
                    now.month,
                    now.day,
                    _selectedTime.hour,
                    _selectedTime.minute,
                  ),
                );
                MainRepository.changeSchedule(schedule);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.homeScreen,
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInputWidget() {
    return GestureDetector(
      onTap: () {
        showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        ).then((value) {
          setState(() {
            if (value != null) {
              _selectedTime = value;
              _hoursController.text = _selectedTime.hour.toString();
              _minutesController.text = _selectedTime.minute.toString();
            }
          });
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 24.v,
          horizontal: 24.h,
        ),
        decoration: BoxDecoration(
          color: appTheme.whiteA700,
          border: Border.all(
            color: appTheme.gray300,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildTimeInputField(
                _hoursController,
                localizations.hours,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.h, 0, 10.v, 28.v),
              child: Text(
                ':',
                style: TextStyle(fontSize: 36),
              ),
            ),
            Expanded(
              child: _buildTimeInputField(
                _minutesController,
                localizations.minutes,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInputField(
    TextEditingController controller,
    String hint,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: false,
          controller: controller,
          style: theme.textTheme.displaySmall,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: appTheme.gray5001,
            hintText: '00',
            hintStyle: theme.textTheme.displaySmall,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4.v,
        ),
        Text(
          hint,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
