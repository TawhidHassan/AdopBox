import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:showcaseview/showcaseview.dart';

import '../Constants/Colors/app_colors.dart';

import 'Pages/Create Post/create_post_page.dart';
import 'Pages/Home/home_page.dart';
import 'Pages/Inbox/inbox_page.dart';
import 'Pages/More/more.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController=PageController();
  Box? users;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    users =Hive.box('users');


    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ShowCaseWidget(
        onComplete: (index, key){
          print("Show Done");
          print(index);
          if(index==2){
            // BlocProvider.of<ShowCaseCubit>(context).scroolBottom();
          }
          // loginDataSave!.storeShowCae(users,"done");
        },
        builder: Builder(
            builder: (context) => Container(
              height: 1.0.sh,
              width: 1.0.sw,

              child:  SizedBox.expand(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _selectedIndex = index);
                  },
                  children:[
                    HomePage(),
                    CreatePostPage(),
                    InboxPage(),
                    MorePage(),

                  ],
                ),
              ),
            )
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          // unselectedLabelStyle: TextStyle(fontSize: 12.sp),
          // selectedLabelStyle: TextStyle(fontSize: 14.sp),
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColorx,
          unselectedLabelStyle: TextStyle(color: unSelectTextColor),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: kPrimaryColorx,
                ),
                icon: Container(

                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: unSelectTextColor,
                  ),
                ),
                label: "Explore"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "assets/icons/add.svg",
                  color: kPrimaryColorx,
                ),
                icon: Container(

                  child: SvgPicture.asset(
                    "assets/icons/add.svg",
                    color: unSelectTextColor,
                  ),
                ),
                label:"post Create"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "assets/icons/sms.svg",
                  color: kPrimaryColorx,
                ),
                icon: Container(

                  child: SvgPicture.asset(
                    "assets/icons/sms.svg",
                    color: unSelectTextColor,
                  ),
                ),
                label: "Inbox"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "assets/icons/more.svg",
                  color: kPrimaryColorx,
                ),
                icon: Container(

                  child: SvgPicture.asset(
                    "assets/icons/more.svg",
                    color: unSelectTextColor,
                  ),
                ),
                label: "More"),




          ],
        ),
      ),
    );
  }
}