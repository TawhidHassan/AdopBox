import 'package:AdopBox/Presentation/Pages/Inbox/chat_page.dart';
import 'package:AdopBox/Presentation/Pages/Set%20Preference/set_preference_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/Slider/slider_cubit.dart';
import '../Constants/Strings/app_strings.dart';
import '../Presentation/Pages/Create Post/create_post_page.dart';
import '../Presentation/Pages/Post/all_post_page.dart';
import '../Presentation/Pages/Set Radius/set_radius_page.dart';
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


    case SET_PREFERENCE_PAGE:
      return MaterialPageRoute(builder: (_) => SetPreferencePage());
    case SET_RADIUS_PAGE:
      return MaterialPageRoute(builder: (_) => SetRadiusPage());
    case ALL_POST_PAGE:
      return MaterialPageRoute(builder: (_) => AllPostPage());
    case CHAT_PAGE_PAGE:
      return MaterialPageRoute(builder: (_) => ChatPage());



      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SliderCubit(),
              child: MainScreen(),
            ));
    }
  }
}
