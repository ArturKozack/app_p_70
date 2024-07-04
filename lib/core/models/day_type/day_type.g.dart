// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayTypeAdapter extends TypeAdapter<DayType> {
  @override
  final int typeId = 0;

  @override
  DayType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DayType.all;
      case 1:
        return DayType.monday;
      case 2:
        return DayType.tuesday;
      case 3:
        return DayType.wednesday;
      case 4:
        return DayType.thursday;
      case 5:
        return DayType.friday;
      case 6:
        return DayType.saturday;
      case 7:
        return DayType.sunday;
      default:
        return DayType.all;
    }
  }

  @override
  void write(BinaryWriter writer, DayType obj) {
    switch (obj) {
      case DayType.all:
        writer.writeByte(0);
        break;
      case DayType.monday:
        writer.writeByte(1);
        break;
      case DayType.tuesday:
        writer.writeByte(2);
        break;
      case DayType.wednesday:
        writer.writeByte(3);
        break;
      case DayType.thursday:
        writer.writeByte(4);
        break;
      case DayType.friday:
        writer.writeByte(5);
        break;
      case DayType.saturday:
        writer.writeByte(6);
        break;
      case DayType.sunday:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
