import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Config/text_style.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../Widgets/Button/custom_button.dart';
import '../../Widgets/TextField/bg_textfield.dart';
import '../../Widgets/TextField/text_field_reamarks.dart';

class CreateCommunityPost extends StatelessWidget {
  const CreateCommunityPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select category", style: mediumText(16.sp,),),
                SizedBox(height: 8.h,),
                InkWell(
                  onTap: (){
                    categorSheet(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        border: Border.all(color: borderColor)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Category",style: mediumText(16.sp,color: textColor),),
                        Icon(Icons.keyboard_arrow_right,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description (Optional)", style: mediumText(16.sp,),),
                SizedBox(height: 8.h,),
                SalesCreateRemarkTextfield(
                  readOnly: false,
                  isNumber: false,
                  hintText: "Type description`",
                  lable: "",
                  controller: null,
                  maxLine: 5,
                )
              ],
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
  void categorSheet(BuildContext context){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      // set this to true
      shape: const RoundedRectangleBorder( // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.70,
          initialChildSize: 0.70,
          builder: (_, controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60.h,
                  width: 40.w,

                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture
                          .asset("assets/icons/close.svg",)),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)
                      )
                  ),
                  height: 0.62.sh,
                  width: 1.0.sw,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/border.svg"),
                                  SizedBox(width: 12.w,),
                                  Text("Categories",style: semiBoldText(20.sp,color: appBarTitleTextColor),)
                                ],
                              ),
                            ),
                            Divider(color: unSelectColor,thickness: 2,)
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 13,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 14,
                              gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 11.0,
                                crossAxisSpacing: 0.0,
                                childAspectRatio:4/5,
                              ),
                              itemBuilder:(context,index){
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:74.h,
                                      width: 74.w,
                                      padding:EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                        // color: kPrimaryColorx,
                                          borderRadius: borderRadius,
                                          border: Border.all(color: borderColor)
                                      ),
                                      child: Image.asset("assets/icons/dogy.png"),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text("Dog",style: mediumText(14.sp,color: appBarTitleTextColor),)
                                  ],
                                );
                              }
                          ),
                        ),
                      ),

                      Expanded(
                          flex: 3,
                          child:Column(
                            children: [
                              Divider(color: unSelectColor,thickness: 2,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 6),
                                child: CustomButton(
                                    height: 48.h,
                                    borderRadius: 4,
                                    color:kPrimaryColorx,
                                    textColor: Colors.white,
                                    title: "Apply",
                                    onTap: () {

                                    }),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
