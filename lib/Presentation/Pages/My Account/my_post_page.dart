import 'package:flutter/material.dart';

import 'Component/my_post.dart';

class MyPostpage extends StatelessWidget {
  const MyPostpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Post"),
      ),
      body: MyPost(),
    );
  }
}
