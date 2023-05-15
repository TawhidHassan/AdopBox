import 'package:flutter/material.dart';

import '../../../Constants/Strings/app_strings.dart';
import 'Component/settings_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, CHANGE_PASSWORD_PAGE);
                },
                child: SettingButton(image: "assets/icons/key.svg",title:"Change password" )),

            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SET_RADIUS_PAGE);
                },
                child: SettingButton(image: "assets/icons/radar.svg",title:"Set radius" )),
            SettingButton(image: "assets/icons/money-4.svg",title:"Set currency" ),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SET_PREFERENCE_PAGE);

                },
                child: SettingButton(image: "assets/icons/like.svg",title:"Change preference" )),
            SettingButton(image: "assets/icons/close-2.svg",title:"Deactivate account" ),
          ],
        ),
      ),
    );
  }
}
