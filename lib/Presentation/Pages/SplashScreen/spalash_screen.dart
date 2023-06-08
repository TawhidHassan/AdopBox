import 'dart:async';

import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../../Dependenci Injection/injection.dart';
import '../../../Getx Injection/getx_dependenci_injection.dart';
import '../../../Service/LocalDataBase/localdata.dart';



class SpalashScreen extends StatefulWidget {
  const SpalashScreen({Key? key}) : super(key: key);

  @override
  _SpalashScreenState createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  double _textOpacity = 0.0;
  bool isPreference=false;
  bool isLogin=false;

  var localBd;
  @override
  void initState(){
    // TODO: implement initState
    // injection();
    // init();
    localBd=getIt<LocalDataGet>();
    checkLogin();

    Timer(Duration(seconds: 4), () {
      setState(() {
        if(isPreference&&isLogin){
          Navigator.pushReplacementNamed(context,MAIN_PAGE);
        }else if(!isPreference){
          Navigator.pushNamedAndRemoveUntil(
            context, SET_PREFERENCE_PAGE,(route) => false,);
        }else{
          Navigator.pushNamedAndRemoveUntil(
            context, LOGIN_PAGE,(route) => false,);
        }
        // isPreference? Navigator.pushReplacementNamed(context,MAIN_PAGE): Navigator.pushNamedAndRemoveUntil(
        //     context, SET_PREFERENCE_PAGE,(route) => false,);
        // isPreference?
        // Navigator.pushReplacement(context, PageTransition(MainScreen())):Navigator.pushReplacement(context, PageTransition(MainScreen()));
      });
    });

    super.initState();
  }
  void checkLogin() async {
    var categories=await localBd.getPrefarenceData();
    var token=await localBd.getData();
    if(categories.get('categories')!=null){
      setState(() {
        isPreference=true;
      });
    }else{
      setState(() {
        isPreference=false;
      });
    }
    if (token.get('token') != null) {
      setState(() {
        isLogin=true;
      });
    }
    else {
      setState(() {
        isLogin=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorx,
        body:Container(
          height: 1.0.sh,
            width: 1.0.sw,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset('assets/images/Somriddhi.png')
                        Text("AdopBox",style: boldText(32.sp,color: Colors.white),)
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 40,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("Powered By",style: TextStyle(fontSize: 12),),
                      // SvgPicture.asset('assets/images/maaclogo.svg')
                    ],
                  ),
                ),
              )
            ],
          )

        )
    );
  }


}

