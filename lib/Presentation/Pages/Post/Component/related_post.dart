import 'package:flutter/material.dart';

import '../../Home/Component/post_card.dart';


class RelatedPost extends StatelessWidget {
  const RelatedPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 13.0,
          crossAxisSpacing: 13.0,
          childAspectRatio:4/6,
        ),
        itemBuilder:(context,index){
          return Postcard();
        }
    );
  }
}
