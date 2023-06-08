// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'ImageResponse.g.dart';

@JsonSerializable()
class ImageResponse{



  String? status;
  String? photo;


  ImageResponse(this.status, this.photo);

  factory ImageResponse.fromJson(Map<String,dynamic>json)=>
      _$ImageResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$ImageResponseToJson(this);
}