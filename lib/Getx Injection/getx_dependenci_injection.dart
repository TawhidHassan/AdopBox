
import 'package:AdopBox/GetX%20Controller/AuthController/AuthController.dart';
import 'package:AdopBox/GetX%20Controller/CategoryController/CategoryController.dart';
import 'package:AdopBox/GetX%20Controller/Home/HomeController.dart';
import 'package:AdopBox/GetX%20Controller/Map/MapController.dart';
import 'package:AdopBox/Repository/CategoryRepository/CatgoryRepository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Dependenci Injection/injection.dart';
import '../GetX Controller/ConectivityCheck/ConectivityController.dart';
import '../GetX Controller/Post/PostController.dart';
import '../GetX Controller/PostCreate/PostCreateController.dart';
import '../GetX Controller/Slider/SliderController.dart';
import '../Repository/AuthRepository/AuthRepository.dart';
import '../Repository/PostRepository/PostRepository.dart';
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
  Get.lazyPut(() => AuthRepository());
  Get.lazyPut(() => CategoryRepository());
  Get.lazyPut(() => PostRepository());
  // Get.lazyPut(() => TeacherRepository());
  // Get.lazyPut(() => QuizRepository());
  // Get.lazyPut(() => PolicyRepository());
  // Get.lazyPut(() => CourseQueryRepository());

  // Controller

  Get.lazyPut(() => SliderController(sliderRepository: Get.find<SliderRepository>()));
  Get.lazyPut(() => AuthController(authRepository: Get.find<AuthRepository>()));
  Get.lazyPut(() => CategoryController(categoryRepository: Get.find<CategoryRepository>()));
  Get.lazyPut(() => MapController(sliderRepository: Get.find<SliderRepository>()));
  Get.lazyPut(() => HomeController(sliderRepository: Get.find<SliderRepository>()));
  Get.lazyPut(() => PostCreateController(postRepository: Get.find<PostRepository>(),localDataGet: localDb));
  Get.lazyPut(() => PostController(postRepository: Get.find<PostRepository>(),localDataGet: localDb));
  Get.lazyPut(() => ConnectivityController());

  // Get.lazyPut(() => CartController(courseRepository: Get.find<CourseRepository>(),localDataGet: localDb));


  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();

  return _languages;
}