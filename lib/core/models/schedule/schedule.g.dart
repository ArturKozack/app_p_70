// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleModelAdapter extends TypeAdapter<ScheduleModel> {
  @override
  final int typeId = 1;

  @override
  ScheduleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleModel(
      days: (fields[0] as List).cast<DayType>(),
      startDate: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.days)
      ..writeByte(1)
      ..write(obj.startDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
