import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Config/text_style.dart';
import '../../../../Constants/Colors/app_colors.dart';
import '../../../Widgets/TextField/bg_textfield.dart';
import '../../Home/Component/post_card.dart';


class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 0),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: 20,
          gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 13.0,
            crossAxisSpacing: 13.0,
            childAspectRatio:4/6,
          ),
          itemBuilder:(context,index){
            return Postcard();
          }
      ),
    );
  }
}
