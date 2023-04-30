import 'package:Shomridhi/Config/text_style.dart';
import 'package:Shomridhi/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
 final String? image;
 final String? title;
 final String? discription;
 final bool? lotti;
  const EmptyWidget({Key? key, this.image, this.title, this.discription,this.lotti=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.0.sw,
      height: 1.0.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          lotti! ?
          Lottie.asset("assets/lottie/empty_box.json",height: 200.h)
              :
          Image.asset(image!,height: 100.h,),
          SizedBox(height: 15,),
          Text(title??"",style: boldText(14.sp,color: kPrimaryColorx),),
          SizedBox(height: 10,),
          Text(discription??"",style: mediumText(11.sp,color: kPrimaryColorx),),
        ],
      ),
    );
  }
}
