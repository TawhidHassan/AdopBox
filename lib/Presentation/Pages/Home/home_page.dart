
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../Constants/Strings/app_strings.dart';




class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  ScrollController scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    // Get.find<SliderController>().increment();

      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Image.asset("assets/images/Somriddhi.png",height: 30.h,),
          actions: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, CART_PAGE);
              },
              child: SvgPicture.asset("assets/icons/shopping-cart.svg"),
            ),
            SizedBox(width: 18.w,),
          ],
        ),
        body: Container(
          color: Colors.white,
          height: 1.0.sh,
          width: 1.0.sw,
          child:  RefreshIndicator(
            onRefresh:()=> refreshList(context),
            child: CustomScrollView(
              controller: scrollController,
              slivers:  [

              ],
            ),
          ),
        ),
      );
  }
   Future<void>refreshList(BuildContext context) async{
     await Future.delayed(const Duration(seconds: 1));


   }
}