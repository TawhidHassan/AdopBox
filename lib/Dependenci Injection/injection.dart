
import 'package:Shomridhi/Repository/SliderRepository/slider_repository.dart';

import 'package:Shomridhi/service/SSL%20Commerce/ssl_config.dart';
import 'package:get_it/get_it.dart';

import '../Constants/Strings/app_strings.dart';
import '../Network/api_client.dart';
import '../Presentation/Widgets/AleartDialouge/aleart_dialouge_widget.dart';

import '../Service/LocalDataBase/localdata.dart';
import '../service/location_service.dart';


GetIt getIt=GetIt.instance;

Future injection()async{
    getIt.allowReassignment=true;
    // getIt.registerSingleton<ApiClient>(ApiClientImplementation(),
    //     signalsReady: true);
    // getIt.registerLazySingleton(() => ApiClient(appBaseUrl: BASE_URL));
    getIt.registerSingleton<ApiClient>(ApiClient(appBaseUrl: BASE_URL));
    // getIt.registerSingleton<SslConfig>(SslConfig());
    getIt.registerLazySingleton(() =>SslConfig());
    // getIt.registerSingleton<CustomAleartDialouge>(CustomAleartDialouge());
    getIt.registerLazySingleton(()=>CustomAleartDialouge());
    // // getIt.registerSingleton(() => ApiClient(appBaseUrl: BASE_URL));
    // getIt.registerSingleton<LocationService>(LocationService());
    getIt.registerLazySingleton(()=>LocationService());
    // getIt.registerSingleton<LocalDataGet>(LocalDataGet());
    getIt.registerLazySingleton(()=>LocalDataGet());
    // getIt.registerSingleton<SliderRepository>(SliderRepository());
    getIt.registerLazySingleton(()=>SliderRepository());
    // getIt.registerSingleton<CategoryRepository>(CategoryRepository());
    // getIt.registerLazySingleton(()=>CategoryRepository());
    // // getIt.registerSingleton<CourseRepository>( CourseRepository());
    // getIt.registerLazySingleton(()=> CourseRepository());
    // // getIt.registerSingleton<TeacherRepository>(TeacherRepository());
    // getIt.registerLazySingleton(()=>TeacherRepository());



   }

//
// getIt.allowReassignment=true;
//
//
// // getIt.registerSingleton<ApiClient>(ApiClientImplementation(),
// //     signalsReady: true);
// getIt.registerSingleton<ApiClient>(ApiClient(appBaseUrl: BASE_URL),signalsReady: true);
// // getIt.registerSingleton(() => ApiClient(appBaseUrl: BASE_URL));
// getIt.registerSingleton<LocationService>(LocationService());
// getIt.registerSingleton<LocalDataGet>(LocalDataGet());
// getIt.registerSingleton<SliderRepository>(SliderRepository());
// getIt.registerSingleton<CategoryRepository>(CategoryRepository());
// getIt.registerSingleton<CourseRepository>( CourseRepository());
// getIt.registerSingleton<TeacherRepository>(TeacherRepository());