
import 'package:AdopBox/GetX%20Controller/Home/HomeController.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Dependenci Injection/injection.dart';
import '../GetX Controller/ConectivityCheck/ConectivityController.dart';
import '../GetX Controller/PostCreate/PostCreateController.dart';
import '../GetX Controller/Slider/SliderController.dart';
import '../Repository/SliderRepository/slider_repository.dart';
import '../Service/LocalDataBase/localdata.dart';


Future<Map<String, Map<String, String>>> init() async {

  // var apiclient=getIt<ApiClient>();
  var localDb=getIt<LocalDataGet>();
  // print("calll get x");
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences);
  // Get.lazyPut(() => ApiClient(appBaseUrl: BASE_URL));


  // Repository
  Get.lazyPut(() => SliderRepository());
  // Get.lazyPut(() => AuthRepository());
  // Get.lazyPut(() => CourseRepository());
  // Get.lazyPut(() => TeacherRepository());
  // Get.lazyPut(() => QuizRepository());
  // Get.lazyPut(() => PolicyRepository());
  // Get.lazyPut(() => CourseQueryRepository());

  // Controller

  Get.lazyPut(() => SliderController(sliderRepository: Get.find<SliderRepository>()));
  Get.lazyPut(() => MapController(sliderRepository: Get.find<SliderRepository>()));
  Get.lazyPut(() => HomeController(sliderRepository: Get.find<SliderRepository>()));
  Get.lazyPut(() => PostCreateController(sliderRepository: Get.find<SliderRepository>()));
  Get.lazyPut(() => ConnectivityController());

  // Get.lazyPut(() => CartController(courseRepository: Get.find<CourseRepository>(),localDataGet: localDb));


  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();

  return _languages;
}