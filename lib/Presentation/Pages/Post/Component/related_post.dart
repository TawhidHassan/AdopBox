import 'package:flutter/material.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../../Data/Model/Post/Post.dart';
import '../../Home/Component/post_card.dart';


class RelatedPost extends StatelessWidget {
 final List<Post>? post;
  const RelatedPost({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: post!.length,
        gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 13.0,
          crossAxisSpacing: 13.0,
          childAspectRatio:4/6,
        ),
        itemBuilder:(context,index){
          // return Postcard();
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, POST_DETAILS,arguments: {
                'id':post![index].id,
                'catId':post![index].category!.id,
              });
            },
            child: Postcard(
              title: post![index].postTitle,
              image:post![index].photos![0],
              price: post![index].price!=null?
              post![index].price!.toString():"Free",

            ),
          );
        }
    );
  }
}
