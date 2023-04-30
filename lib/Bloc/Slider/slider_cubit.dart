import 'package:Shomridhi/Data/Model/Home/Slider/SliderResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../../Dependenci Injection/injection.dart';
import '../../Network/api_client.dart';
import '../../Repository/SliderRepository/slider_repository.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState>with HydratedMixin {
  SliderCubit() : super(SliderInitial());
  var sliderRepo =getIt<SliderRepository>();

  void getSlider() {
    sliderRepo.getSlider().then((value){
      if(value!=null){
        emit(SlidersGet(sliderResponse: value));
      }
    });

  }

  @override
  SliderState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return SlidersGet.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SliderState state) {
    // TODO: implement toJson
    if (state is SlidersGet) {
      return state.toMap();
    } else {
      return null;
    }
  }


}
