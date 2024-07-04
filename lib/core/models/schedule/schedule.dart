import 'package:app_p_70/core/models/day_type/day_type.dart';
import 'package:hive/hive.dart';

part 'schedule.g.dart';

@HiveType(typeId: 1)
class ScheduleModel {
  @HiveField(0)
  List<DayType> days;

  @HiveField(1)
  DateTime startDate;

  ScheduleModel({
    required this.days,
    required this.startDate,
  });

  ScheduleModel copyWith({
    List<DayType>? items,
    DateTime? time,
  }) {
    return ScheduleModel(
      days: items != null ? List.from(items) : this.days,
      startDate: time ?? this.startDate,
    );
  }
}
