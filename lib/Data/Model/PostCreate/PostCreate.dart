// ignore_for_file: file_names
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PostCreate.g.dart';


@HiveType(typeId: 0)
class PostCreate extends HiveObject {
  @HiveField(0)
  num? published;
  @HiveField(1,defaultValue: [])
  List<String>?termsAndConditions;
  @HiveField(2)
  String?description;
  @HiveField(3)
  List<String>?photos;
  @HiveField(4)
  num?price;
  @HiveField(5)
  num?postType;
  @HiveField(6)
  String?postTitle;
  @HiveField(7)
  num?weight;
  @HiveField(8)
  num?age;
  @HiveField(9)
  String?breed;
  @HiveField(10)
  String?origin;
  @HiveField(11)
  String?category;
  @HiveField(12)
  bool?dieseas;
  @HiveField(13)
  num?gender;
  @HiveField(14)
  bool?vaccinated;
  @HiveField(15)
  String?petType;
  @HiveField(16)
  num?lat;
  @HiveField(17)
  num?long;
  @HiveField(18)
  String?postUserName;
  @HiveField(19)
  String?postUsernumber;
  @HiveField(20)
  String?postUser;
  @HiveField(21)
  num?uniqueId;

  PostCreate(
  {
      this.published,
      this.termsAndConditions,
      this.description,
      this.photos,
      this.price,
      this.postType,
      this.postTitle,
      this.weight,
      this.age,
      this.breed,
      this.origin,
      this.category,
      this.dieseas,
      this.gender,
      this.vaccinated,
      this.petType,
      this.lat,
      this.long,
      this.postUserName,
      this.postUsernumber,
      this.postUser,
      this.uniqueId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCreate &&
          runtimeType == other.runtimeType &&
          published == other.published &&
          termsAndConditions == other.termsAndConditions &&
          description == other.description &&
          photos == other.photos &&
          price == other.price &&
          postType == other.postType &&
          postTitle == other.postTitle &&
          weight == other.weight &&
          age == other.age &&
          breed == other.breed &&
          origin == other.origin &&
          category == other.category &&
          dieseas == other.dieseas &&
          gender == other.gender &&
          vaccinated == other.vaccinated &&
          petType == other.petType &&
          lat == other.lat &&
          long == other.long &&
          postUserName == other.postUserName &&
          postUsernumber == other.postUsernumber &&
          postUser == other.postUser &&
          uniqueId == other.uniqueId;

  @override
  int get hashCode =>
      published.hashCode ^
      termsAndConditions.hashCode ^
      description.hashCode ^
      photos.hashCode ^
      price.hashCode ^
      postType.hashCode ^
      postTitle.hashCode ^
      weight.hashCode ^
      age.hashCode ^
      breed.hashCode ^
      origin.hashCode ^
      category.hashCode ^
      dieseas.hashCode ^
      gender.hashCode ^
      vaccinated.hashCode ^
      petType.hashCode ^
      lat.hashCode ^
      long.hashCode ^
      postUserName.hashCode ^
      postUsernumber.hashCode ^
      postUser.hashCode ^
      uniqueId.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'published': this.published,
      'termsAndConditions': this.termsAndConditions,
      'description': this.description,
      'photos': this.photos,
      'price': this.price,
      'postType': this.postType,
      'postTitle': this.postTitle,
      'weight': this.weight,
      'age': this.age,
      'breed': this.breed,
      'origin': this.origin,
      'category': this.category,
      'dieseas': this.dieseas,
      'gender': this.gender,
      'vaccinated': this.vaccinated,
      'petType': this.petType,
      'lat': this.lat,
      'long': this.long,
      'postUserName': this.postUserName,
      'postUsernumber': this.postUsernumber,
      'postUser': this.postUser,
      'uniqueId': this.uniqueId,
    };
  }

  factory PostCreate.fromMap(Map<String, dynamic> map) {
    return PostCreate(
      published: map['published'] as num,
      termsAndConditions: map['termsAndConditions'] as List<String>,
      description: map['description'] as String,
      photos: map['photos'] as List<String>,
      price: map['price'] as num,
      postType: map['postType'] as num,
      postTitle: map['postTitle'] as String,
      weight: map['weight'] as num,
      age: map['age'] as num,
      breed: map['breed'] as String,
      origin: map['origin'] as String,
      category: map['category'] as String,
      dieseas: map['dieseas'] as bool,
      gender: map['gender'] as num,
      vaccinated: map['vaccinated'] as bool,
      petType: map['petType'] as String,
      lat: map['lat'] as num,
      long: map['long'] as num,
      postUserName: map['postUserName'] as String,
      postUsernumber: map['postUsernumber'] as String,
      postUser: map['postUser'] as String,
      uniqueId: map['uniqueId'] as num,
    );
  }
// factory PostCreate.fromJson(Map<String,dynamic>json)=>
  //     _$PostCreateFromJson(json);
  // Map<String,dynamic>toJson()=>_$PostCreateToJson(this);






}









