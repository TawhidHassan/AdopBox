import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Loading/loading_widget.dart';


class Postcard extends StatelessWidget {
 final String?image,title,price;
  const Postcard({Key? key, this.image, this.title, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: borderColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
              child:
              CachedNetworkImage(
                imageUrl: image!,
                placeholder: (context, url) => SizedBox(
                    height: 50,
                    child: LoadingWidget()),
                imageBuilder: (context, image) =>
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            topLeft: Radius.circular(4),
                          ),
                          image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover
                          )
                      ),

                    ),
              ),
          ),
          Expanded(
            flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title!.length>12?title!.substring(0,13)+"..":title!,style: regularText(14.sp,color: textColor),),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/taka.svg"),
                          SizedBox(width: 8.w,),
                          Text(price!,style: boldText(16.sp,color: kPrimaryColorx),)
                        ],
                      )
                    ],
                ),
              )
          )
        ],
      ),
    );
  }
}
