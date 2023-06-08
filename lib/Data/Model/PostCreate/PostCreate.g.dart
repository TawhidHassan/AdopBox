// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostCreate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostCreateAdapter extends TypeAdapter<PostCreate> {
  @override
  final int typeId = 0;

  @override
  PostCreate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostCreate(
      published: fields[0] as num?,
      termsAndConditions:
          fields[1] == null ? [] : (fields[1] as List?)?.cast<String>(),
      description: fields[2] as String?,
      photos: (fields[3] as List?)?.cast<String>(),
      price: fields[4] as num?,
      postType: fields[5] as num?,
      postTitle: fields[6] as String?,
      weight: fields[7] as num?,
      age: fields[8] as num?,
      breed: fields[9] as String?,
      origin: fields[10] as String?,
      category: fields[11] as String?,
      dieseas: fields[12] as bool?,
      gender: fields[13] as num?,
      vaccinated: fields[14] as bool?,
      petType: fields[15] as String?,
      lat: fields[16] as num?,
      long: fields[17] as num?,
      postUserName: fields[18] as String?,
      postUsernumber: fields[19] as String?,
      postUser: fields[20] as String?,
      uniqueId: fields[21] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, PostCreate obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.published)
      ..writeByte(1)
      ..write(obj.termsAndConditions)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.photos)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.postType)
      ..writeByte(6)
      ..write(obj.postTitle)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.age)
      ..writeByte(9)
      ..write(obj.breed)
      ..writeByte(10)
      ..write(obj.origin)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.dieseas)
      ..writeByte(13)
      ..write(obj.gender)
      ..writeByte(14)
      ..write(obj.vaccinated)
      ..writeByte(15)
      ..write(obj.petType)
      ..writeByte(16)
      ..write(obj.lat)
      ..writeByte(17)
      ..write(obj.long)
      ..writeByte(18)
      ..write(obj.postUserName)
      ..writeByte(19)
      ..write(obj.postUsernumber)
      ..writeByte(20)
      ..write(obj.postUser)
      ..writeByte(21)
      ..write(obj.uniqueId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCreateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
