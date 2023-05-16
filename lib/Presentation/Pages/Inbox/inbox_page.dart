import 'package:AdopBox/Config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/Colors/app_colors.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../Widgets/TextField/icon_bg_textfield.dart';
import 'Component/user_chat_card.dart';


class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: IconBackgroundTextfield(
                bgColor: whiteBackground,
                controller: null,
                hintText: "Search here",
                isNumber: false,
                readOnly: false,
                borderColor: borderColor,
                icons: "assets/icons/search.svg",
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView(
                children: [

                  InkWell(
                       onTap:(){
                         Navigator.pushNamed(context, CHAT_PAGE_PAGE);
                       },
                      child: UserChatCard()),
                  UserChatCard(),
                  UserChatCard(),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
