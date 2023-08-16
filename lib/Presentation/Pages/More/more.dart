import 'package:AdopBox/Config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../../../Constants/Colors/app_colors.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Dependenci Injection/injection.dart';
import '../../../Getx Injection/getx_dependenci_injection.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Button/custom_button.dart';
import '../Settings/Component/settings_button.dart';
import 'Component/more_card.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {

  String? token;
  String? name;
  String? image="";
  String? firstName;
  String? lastName;
  String? email;
  String? role;


  @override
  void initState() {
    // TODO: implement initState
    getToken();
    super.initState();
  }

  void getToken() async{
    var tokenx = await getIt<LocalDataGet>().getData();
    if(tokenx.get('token')!=null){
      setState(() {
        token=tokenx.get('token');
        role=tokenx.get('role');
        image=tokenx.get('image');
        name=tokenx.get('name');
        email=tokenx.get('email');
        firstName=tokenx.get('firstName');
        lastName=tokenx.get('lastName');
      });
      Logger().e(tokenx.get('name'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        height: 1.0.sh,
        width: 1.0.sw,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex:2,
                        child: Container(
                          height: 64.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage("assets/images/user.png"),
                              fit: BoxFit.contain
                            )
                          ),
                        )),
                    SizedBox(width: 16.w,),
                    Expanded(
                      flex:11,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name??"Mr. Nobody",style: semiBoldText(20.sp,color: textColor),),
                          SizedBox(height: 6.h,),
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, LOGIN_PAGE);
                              },
                              child: Text(email??"Log in or sign up to ",style: regularText(14.sp,color: textColor),)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Divider(
                  color: dividerColor,thickness: 1,)
            ),
            Expanded(
                flex: 11,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      token==null?SizedBox(): Container(
                        padding:EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                        width:1.0.sw,
                        child: Row(
                          children: [
                            Expanded(
                                child:InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, NOTIFICATION_PAGE);
                                    },
                                    child: MoreCard(image:"assets/icons/notification.svg",title: "Notifications",))
                            ),
                            SizedBox(width: 11.w,),
                            Expanded(
                                child:InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, COMUNITY_POST_PAGE);
                                    },
                                    child: MoreCard(image:"assets/icons/message.svg",title: "Community",))
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h,),
                      token==null?SizedBox(): Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text("My account",style: mediumText(14.sp,color: textColorTwo),),
                          ),
                          SizedBox(height: 16.h,),
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, PROFILE_PAGE);
                              },
                              child: SettingButton(image: "assets/icons/user.svg",title:"My profile" ,padding: 20,)),
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, MY_POST_PAGE);
                              },
                              child: SettingButton(image: "assets/icons/post.svg",title:"My posts" ,padding: 20)),
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, MY_FAVORAITE_POST_PAGE);
                              },
                              child: SettingButton(image: "assets/icons/lovely.svg",title:"Favourite post",padding: 20 )),
                        ],
                      ),
                      Divider(
                        color: unSelectColor,thickness: 6,
                      ),
                      SizedBox(height: 16.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("Settings",style: mediumText(14.sp,color: textColorTwo),),
                      ),
                      SizedBox(height: 16.h,),
                      token==null?SizedBox(): InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, CHANGE_PASSWORD_PAGE);
                          },
                          child: SettingButton(image: "assets/icons/key.svg",title:"Change password",padding: 20 )),

                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, SET_RADIUS_PAGE);
                          },
                          child: SettingButton(image: "assets/icons/radar.svg",title:"Set radius",padding: 20 )),
                      SettingButton(image: "assets/icons/money-4.svg",title:"Set currency",padding: 20 ),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, SET_PREFERENCE_PAGE);

                          },
                          child: SettingButton(image: "assets/icons/like.svg",title:"Change preference",padding: 20 )),
                      SettingButton(image: "assets/icons/close-2.svg",title:"Deactivate account" ,padding: 20),
                      Divider(
                        color: unSelectColor,thickness: 6,
                      ),
                      SizedBox(height: 16.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("More",style: mediumText(14.sp,color: textColorTwo),),
                      ),
                      SizedBox(height: 16.h,),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, FAQ_PAGE);
                          },
                          child: SettingButton(image: "assets/icons/key.svg",title:"Frequently asked question",padding: 20 )),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, ABOUT_PAGE);
                          },
                          child: SettingButton(image: "assets/icons/radar.svg",title:"About app",padding: 20 )),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, PRIVACY_PAGE);
                          },
                          child: SettingButton(image: "assets/icons/money-4.svg",title:"Privacy policy",padding: 20 )),

                      Divider(
                        color: unSelectColor,thickness: 6,
                      ),
                      SizedBox(height: 16.h,),
                      InkWell(
                          onTap: (){
                            token==null?
                            Navigator.pushNamed(context, LOGIN_PAGE)
                                :
                            showAlertDialog(context);
                          },
                          child: SettingButton(image: "assets/icons/logout.svg",title:token==null?"Login":"Logout",padding: 20 )),

                    ],
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            height: 48.h,
            borderRadius: 4,
            width: 120,
            color: kPrimaryColorx,
            textColor: Colors.white,
            boder: true,
            title: "Cancel",
            onTap: () {
              Navigator.pop(context);
            }),
        SizedBox(width: 12,),
        CustomButton(
            height: 48.h,
            width: 120,
            borderRadius: 4,
            color: kPrimaryColorx,
            textColor: Colors.white,
            boder: false,
            title: "Logout",
            onTap: () {
              deleteData(context);
            })
      ],
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      title: Text("Confirmation",style: boldText(20.sp,color: kPrimaryColorx),textAlign: TextAlign.center,),
      content: SizedBox(
          width: 300,
          child: Text("Are you sure you want to logout ?",style: regularText(15.sp,),textAlign: TextAlign.center)),
      actions: [
        cancelButton,
        SizedBox(height: 20,)

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void deleteData(BuildContext context)async{
    var users = await Hive.openBox('users');
    users.clear().then((value) {
      injection();
      init();
    });
    ///update bearer token in api client
    ///update dependencies

    Navigator.pushNamedAndRemoveUntil(context, LOGIN_PAGE,(route) => false,);

  }
}
