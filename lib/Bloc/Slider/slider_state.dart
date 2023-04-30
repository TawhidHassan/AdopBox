part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}
class SlidersGet extends SliderState {
  final SliderResponse? sliderResponse;

  SlidersGet({this.sliderResponse});

  Map<String, dynamic> toMap() {
    return {
      'sliderResponse': this.sliderResponse,
    };
  }

  factory SlidersGet.fromMap(Map<String, dynamic> map) {
    return SlidersGet(
      sliderResponse:SliderResponse.fromJson(map['sliderResponse'] as Map<String,dynamic>),
    );
  }
}
