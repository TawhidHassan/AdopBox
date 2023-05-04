import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Config/text_style.dart';
import '../../Widgets/TextField/bg_textfield.dart';
import 'Component/chat_card.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leslie Alexander"),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(Icons.call))
        ],
      ),
      body: ListView(
        children: [
          ChatCard(),
          ChatCard(me: true,),
          ChatCard(me: true,),
          ChatCard(me: true,),
          ChatCard(),
          ChatCard(),
          ChatCard(me: true,),
        ],
      ),

      bottomSheet: Container(
        height: 80.h,
        width: 1.0.sw,
        color: whiteBackground,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: BackgroundTextfield(
                controller: null,
                readOnly: false,
                isNumber: false,
                isemail: false,
                height: 48.h,
                hintText: "Type message...",
                bgColor: whiteBackground,
                errormsg: "Please enter text",
                borderColor: borderColor,),
            ),
            SizedBox(width: 12.w,),
            Expanded(
                flex: 1,
                child: SvgPicture.asset("assets/icons/sent.svg")
            )
          ],
        ),
      ),
    );
  }
}
