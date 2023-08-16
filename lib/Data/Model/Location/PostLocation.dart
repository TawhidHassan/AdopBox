// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'PostLocation.g.dart';

@JsonSerializable()
class PostLocation{


  String? type;
  List<num>? coordinates;


  PostLocation(this.type, this.coordinates);

  factory PostLocation.fromJson(Map<String,dynamic>json)=>
      _$PostLocationFromJson(json);
  Map<String,dynamic>toJson()=>_$PostLocationToJson(this);
}