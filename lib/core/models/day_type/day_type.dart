import 'package:app_p_70/core/utils/extensions.dart';
import 'package:hive/hive.dart';

part 'day_type.g.dart';

@HiveType(typeId: 0)
enum DayType {
  @HiveField(0)
  all,

  @HiveField(1)
  monday,

  @HiveField(2)
  tuesday,

  @HiveField(3)
  wednesday,

  @HiveField(4)
  thursday,

  @HiveField(5)
  friday,

  @HiveField(6)
  saturday,

  @HiveField(7)
  sunday;

  @override
  String toString() => this.name.capitalized;
}
