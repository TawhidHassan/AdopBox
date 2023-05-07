import 'package:flutter/material.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../Settings/Component/settings_button.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Others"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, FAQ_PAGE);
                },
                child: SettingButton(image: "assets/icons/key.svg",title:"Frequently asked question" )),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, ABOUT_PAGE);
                },
                child: SettingButton(image: "assets/icons/radar.svg",title:"About app" )),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, PRIVACY_PAGE);
                },
                child: SettingButton(image: "assets/icons/money-4.svg",title:"Privacy policy" )),
          ],
        ),
      ),
    );
  }
}
