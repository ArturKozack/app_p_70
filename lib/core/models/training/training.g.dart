// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingModelAdapter extends TypeAdapter<TrainingModel> {
  @override
  final int typeId = 2;

  @override
  TrainingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainingModel(
      date: fields[0] as DateTime,
      duration: fields[1] as Duration,
      isMissed: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TrainingModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.isMissed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
