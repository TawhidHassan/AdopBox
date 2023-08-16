import 'package:flutter/material.dart';

import 'Component/my_fav_post.dart';
import 'Component/my_post.dart';

class MyFavoraitePostpage extends StatelessWidget {
  const MyFavoraitePostpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourite Post"),
      ),
      body: MyfavPost(),
    );
  }
}
