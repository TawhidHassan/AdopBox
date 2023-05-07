import 'package:flutter/material.dart';

import 'Component/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            NotificationCard(title: "Someone committed on your post. "),
            NotificationCard(title: "Someone committed on your post. "),
            NotificationCard(title: "Someone committed on your post. "),
            NotificationCard(title: "Someone committed on your post. "),
          ],
        ),
      ),
    );
  }
}
