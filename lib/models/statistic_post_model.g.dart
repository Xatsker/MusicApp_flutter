// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisticAdapter extends TypeAdapter<Statistic> {
  @override
  final int typeId = 0;

  @override
  Statistic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Statistic(
      fields[0] as String,
      fields[1] as int,
      fields[2] as SvgPicture,
      fields[3] as int,
      fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Statistic obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.svg)
      ..writeByte(3)
      ..write(obj.rightAnswer)
      ..writeByte(4)
      ..write(obj.wrongAnswer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisticAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
