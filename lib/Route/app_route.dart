


import 'package:Shomridhi/Bloc/Slider/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Constants/Strings/app_strings.dart';
import '../Presentation/Pages/SplashScreen/spalash_screen.dart';
import '../Presentation/main_screen.dart';


class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    // final ScreenArguments? arguments = settings.arguments as ScreenArguments;
    final Map? args = settings.arguments as Map?;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SpalashScreen());
      case MAIN_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => MultiBlocProvider(
              providers: [

                BlocProvider(
                  create: (context) => SliderCubit(),
                ),


              ],
              child: MainScreen(),
            )
        );


    // case HOME_PAGE:
    //   return MaterialPageRoute(builder: (_) => Home());


      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SliderCubit(),
              child: MainScreen(),
            ));
    }
  }
}
