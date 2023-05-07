import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Config/text_style.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/Button/custom_button.dart';
import 'Component/community_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adop box community"),
        actions: [
          PopupMenuButton<int>(
            position: PopupMenuPosition.under,
            constraints: BoxConstraints(maxWidth: 230.w, minWidth: 230.w),
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.more_vert, color: Color(0xff231F20), size: 24.sp,)
            ),
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                value: 0,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, COMUNITY_POST_CREATE_PAGE);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/pencil.svg"),
                          SizedBox(width: 13.w,),
                          Text('Create your post', style: mediumText(
                              16.sp, color: appBarTitleTextColor),)
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(color: dividerColor, thickness: 1,)
                  ],
                ),
              ),
              PopupMenuItem(
                  value: 0,
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, SET_RADIUS_PAGE);
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/Document.svg"),
                            SizedBox(width: 13.w,),
                            Text('See your post', style: mediumText(
                                16.sp, color: appBarTitleTextColor),)
                          ],
                        ),
                      ],
                    ),
                  )
              ),

            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          CommunityCard(),
          CommunityCard(),
          CommunityCard(),
          CommunityCard(),
          CommunityCard(),
          CommunityCard(),
        ],
      ),
    );
  }
}
