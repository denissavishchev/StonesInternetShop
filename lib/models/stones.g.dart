// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stones.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StonesAdapter extends TypeAdapter<Stone> {
  @override
  final int typeId = 0;

  @override
  Stone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stone(
      image: fields[1] as String,
      name: fields[2] as String,
      color: fields[3] as String,
      price: fields[4] as String,
      location: fields[5] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Stone obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StonesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
