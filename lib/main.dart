import 'dart:io';
import 'package:AdopBox/Config/text_style.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'Bloc/Slider/slider_cubit.dart';
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
  // await EasyLocalization.ensureInitialized();

  ///dependenci injection
  await injection();
  ///Getx dependenci injection
  Map<String, Map<String, String>> _languages = await di.init();

  runApp(MyApp(router: AppRouter())
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
                debugShowCheckedModeBanner: false,
                title: 'Adopbox',
                theme: ThemeData(
                    primaryColor: kPrimaryColorx,
                    fontFamily: "MavenPro",
                  checkboxTheme: CheckboxThemeData(
                    fillColor: MaterialStateProperty.all(kPrimaryColorx),
                    side: BorderSide(color: borderColor)
                  ),
                  sliderTheme: SliderThemeData(
                    overlayColor: kPrimaryColorx,
                    activeTrackColor: kPrimaryColorx,
                    inactiveTrackColor: kPrimaryColorx.shade100,
                    overlayShape: SliderComponentShape.noOverlay,
                    trackShape: SliderCustomTrackShape(),
                    thumbColor: kPrimaryColorx
                  ),
                  appBarTheme: AppBarTheme(
                    backgroundColor: whiteBackground,
                    iconTheme: IconThemeData(
                      color: appBarTitleTextColor
                    ),
                    titleTextStyle: semiBoldText(18.sp,color: appBarTitleTextColor)
                  ),
                  radioTheme: RadioThemeData(
                    fillColor: MaterialStateProperty.all(kPrimaryColorx)
                  ),

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
class SliderCustomTrackShape
    extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}