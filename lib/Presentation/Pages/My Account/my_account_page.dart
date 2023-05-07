import 'package:AdopBox/Config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/Colors/app_colors.dart';
import 'Component/my_post.dart';
import 'Component/profile.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
      body: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Container(
          height: 1.0.sh,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                flex: 1,

                  child:DecoratedBox(
                    decoration: BoxDecoration(
                      //This is for background color
                      color: Colors.white.withOpacity(0.0),

                      //This is for bottom border that is needed
                      border: Border(
                          bottom: BorderSide(color: unSelectColor, width: 2.sp)),
                    ),
                    child:  TabBar(
                      labelColor: kPrimaryColorx,
                      labelStyle: mediumText(16.sp),
                      unselectedLabelColor: unSelectColor,
                      indicatorColor: kPrimaryColorx,
                      tabs: [
                        Tab(
                          icon: Text(
                            "Profile",
                          ),
                        ),
                        Tab(
                          icon: Text(
                            "My post",
                          ),
                        ),
                        Tab(
                          icon: Text(
                            "Fav post",
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
              Expanded(
                flex: 16,
                  child: TabBarView(
                    children: [
                      Profile(),
                      MyPost(),
                      MyPost(),
                    ],
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
