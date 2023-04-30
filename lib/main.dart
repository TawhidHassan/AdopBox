import 'dart:io';

import 'package:Shomridhi/Bloc/Slider/slider_cubit.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'Constants/Colors/app_colors.dart';
import 'Dependenci Injection/injection.dart';
import 'Getx Injection/getx_dependenci_injection.dart' as di;
import 'Route/app_route.dart';
List<CameraDescription>? cameras;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  ///Hydrate bloc Init
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
  );
  HttpOverrides.global =  MyHttpOverrides();

  ///dp path
  var databasePath = await getApplicationDocumentsDirectory();
  Hive.init(databasePath.path);



  Box? box= await Hive.openBox('users');
  ///hive model init
  // Hive.registerAdapter(CourseDbAdapter());

  ///status bar style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
  ));

  ///localization
  await EasyLocalization.ensureInitialized();

  ///dependenci injection
  await injection();
  ///Getx dependenci injection
  Map<String, Map<String, String>> _languages = await di.init();

  runApp(
      EasyLocalization(
          supportedLocales: const [Locale('bn', 'BD'), Locale('en', 'US')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: const Locale('en', 'US'),
      child:  MyApp(router: AppRouter())
      )
  );
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SliderCubit>(
            create: (context) => SliderCubit(),
          ),
        ],
        child:ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return GetMaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                title: 'Tamplate',
                theme: ThemeData(
                    primaryColor: kPrimaryColorx,
                    fontFamily: "DMSans"
                ),
                onGenerateRoute: router.generateRoute,
              );
            })
    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {

    return super.createHttpClient(context) ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}