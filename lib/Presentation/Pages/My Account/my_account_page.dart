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
      body: Container(
        height: 1.0.sh,
        padding: EdgeInsets.all(20),
        child: Profile(),
      ),
    );
  }
}
