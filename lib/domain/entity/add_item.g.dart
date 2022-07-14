// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddItemAdapter extends TypeAdapter<AddItem> {
  @override
  final int typeId = 2;

  @override
  AddItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddItem(
      stoneImage: fields[0] as String,
      stoneName: fields[1] as String,
      stoneColor: fields[2] as String,
      stonePrice: fields[3] as String,
      stoneLocation: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.stoneImage)
      ..writeByte(1)
      ..write(obj.stoneName)
      ..writeByte(2)
      ..write(obj.stoneColor)
      ..writeByte(3)
      ..write(obj.stonePrice)
      ..writeByte(4)
      ..write(obj.stoneLocation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
