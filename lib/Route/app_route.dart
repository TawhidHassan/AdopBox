import 'package:AdopBox/Bloc/Category/category_cubit.dart';
import 'package:AdopBox/Presentation/Pages/Inbox/chat_page.dart';
import 'package:AdopBox/Presentation/Pages/My%20Account/my_post_page.dart';
import 'package:AdopBox/Presentation/Pages/Set%20Preference/set_preference_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/CategoryBreedOrigin/category_breed_origin_cubit.dart';
import '../Bloc/Slider/slider_cubit.dart';
import '../Constants/Strings/app_strings.dart';
import '../Presentation/Pages/Auth/login_page.dart';
import '../Presentation/Pages/Auth/otp_page.dart';
import '../Presentation/Pages/Auth/personal_info_page.dart';
import '../Presentation/Pages/Auth/signup_page.dart';
import '../Presentation/Pages/Community/communit_details_page.dart';
import '../Presentation/Pages/Community/community_page.dart';
import '../Presentation/Pages/Community/create_community_post.dart';
import '../Presentation/Pages/Create Post/create_post_page.dart';
import '../Presentation/Pages/My Account/edite_profile.dart';
import '../Presentation/Pages/My Account/my_account_page.dart';
import '../Presentation/Pages/My Account/my_favoratite_post_page.dart';
import '../Presentation/Pages/Notification/notification.dart';
import '../Presentation/Pages/Others/OtherPages/about_page.dart';
import '../Presentation/Pages/Others/OtherPages/faq_page.dart';
import '../Presentation/Pages/Others/OtherPages/privacy_page.dart';
import '../Presentation/Pages/Others/other_page.dart';
import '../Presentation/Pages/Password/change_password_page.dart';
import '../Presentation/Pages/Password/forget_password_page.dart';
import '../Presentation/Pages/Post/all_post_page.dart';
import '../Presentation/Pages/Post/post_details_page.dart';
import '../Presentation/Pages/Post/post_direction_page.dart';
import '../Presentation/Pages/Post/user_profile.dart';
import '../Presentation/Pages/Set Radius/set_radius_page.dart';
import '../Presentation/Pages/Settings/settings_page.dart';
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
                BlocProvider(
                  create: (context) => CategoryCubit(),
                ),BlocProvider(
                  create: (context) => CategoryBreedOriginCubit(),
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
    case SETTINGS_PAGE:
      return MaterialPageRoute(builder: (_) => SettingsPage());
    case NOTIFICATION_PAGE:
      return MaterialPageRoute(builder: (_) => NotificationPage());
    case OTHER_PAGE:
      return MaterialPageRoute(builder: (_) => OtherPage());
    case CHANGE_PASSWORD_PAGE:
      return MaterialPageRoute(builder: (_) => ChangePasswordPage());
    case FAQ_PAGE:
      return MaterialPageRoute(builder: (_) => FAQPage());
    case ABOUT_PAGE:
      return MaterialPageRoute(builder: (_) => AboutPage());
    case PRIVACY_PAGE:
      return MaterialPageRoute(builder: (_) => PrivacyPage());
    case PROFILE_PAGE:
      return MaterialPageRoute(builder: (_) => MyAccount());
    case LOGIN_PAGE:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case SIGNUP_PAGE:
      return MaterialPageRoute(builder: (_) => SignupPage());
    case OTP_PAGE:
      return MaterialPageRoute(builder: (_) => OtpPage());
    case PERSONAL_INFO_PAGE:
      return MaterialPageRoute(builder: (_) => PersonalInfoPage());
    case MY_POST_PAGE:
      return MaterialPageRoute(builder: (_) => MyPostpage());
    case POST_CREATE_PAGE:
      return MaterialPageRoute(builder: (_) =>MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CategoryBreedOriginCubit(),
            ),
          ],
          child: CreatePostPage(isLogin: args!["isLogin"],)));
    case MY_FAVORAITE_POST_PAGE:
      return MaterialPageRoute(builder: (_) => MyFavoraitePostpage());
    case EDIT_PROFILE_PAGE:
      return MaterialPageRoute(builder: (_) => EditProfile(user: args!['user'],));
    case FORGET_PASSWORD_PAGE:
      return MaterialPageRoute(builder: (_) => ForgetPasswordPage());
    case COMUNITY_POST_PAGE:
      return MaterialPageRoute(builder: (_) => CommunityPage());
    case COMUNITY_POST_DETAILS_PAGE:
      return MaterialPageRoute(builder: (_) => CommunityDetailsPage());
    case COMUNITY_POST_CREATE_PAGE:
      return MaterialPageRoute(builder: (_) => CreateCommunityPost());
    case POST_DETAILS:
      return MaterialPageRoute(builder: (_) => PostDetailPage(id: args!["id"],catId: args['catId'],));
    case USER_DETAILS:
      return MaterialPageRoute(builder: (_) => Userprofile());
    case POST_DIRECTION_PAGE:
      return MaterialPageRoute(builder: (_) => PostDirectionPage());



      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SliderCubit(),
              child: MainScreen(),
            ));
    }
  }
}
