

import '../../Data/Model/Home/Slider/SliderResponse.dart';
import '../../Dependenci Injection/injection.dart';
import '../../Network/api_client.dart';

class SliderRepository{




 Future getCheck()async{
    getIt<ApiClient>().getData(uri: "target/last-sevenday-data");
    // apiClient.getData(uri: "target/last-sevenday-data",headers: {"xxx":"xxxx"});
  }

  Future<SliderResponse> getSlider() async{
    final userRaw=await getIt<ApiClient>().getData(uri: "slide");

    return SliderResponse.fromJson(userRaw);
  }
}