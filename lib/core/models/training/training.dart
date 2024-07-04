import 'package:app_p_70/core/models/day_type/day_type.dart';
import 'package:app_p_70/core/utils/extensions.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'training.g.dart';

@HiveType(typeId: 2)
class TrainingModel {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  Duration duration;

  @HiveField(2)
  bool isMissed;

  TrainingModel({
    required this.date,
    this.duration = const Duration(minutes: 60),
    this.isMissed = false,
  });

  TrainingModel copyWith({
    DateTime? date,
    Duration? duration,
    bool? isMissed,
  }) {
    return TrainingModel(
        date: date ?? this.date,
        duration: duration ?? this.duration,
        isMissed: isMissed ?? this.isMissed);
  }

  int get points => isMissed ? -duration.inMinutes : duration.inMinutes;

  String get formattedDuration {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);

    String hoursStr = hours > 0 ? '${hours}h ' : '';
    String minutesStr = minutes > 0 ? '${minutes}min' : '';

    return '$hoursStr$minutesStr'.trim();
  }

  String get formattedDate {
    DateFormat dateFormat = DateFormat('dd.MM.yyyy');
    return DayType.values[date.weekday].name.capitalized +
        ' ' +
        dateFormat.format(date);
  }
}
