import 'package:AdopBox/Bloc/Category/category_cubit.dart';
import 'package:AdopBox/Bloc/CategoryBreedOrigin/category_breed_origin_cubit.dart';
import 'package:AdopBox/Config/text_style.dart';
import 'package:AdopBox/Constants/Colors/app_colors.dart';
import 'package:AdopBox/Presentation/Widgets/Loading/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CategoryComponent extends StatelessWidget {
  const CategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getCategory();
    BlocProvider.of<CategoryBreedOriginCubit>(context).getCategoryBreedOrigin();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(

        children: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/border.svg"),
              SizedBox(width: 12.w,),
              Text("Categories",
                style: semiBoldText(20.sp, color: appBarTitleTextColor),)
            ],
          ),
          SizedBox(height: 10.h,),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if(state is !CategoryGet){
                return LoadingWidget();
              }
              final data=(state as CategoryGet).categoryResponse;
              return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data!.getData!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 11.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 4 / 5,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: data.getData![index].icon!,
                          placeholder: (context, url) => SizedBox(
                              height: 50,
                              child: LoadingWidget()),
                          imageBuilder: (context, image) =>
                              Container(
                                height: 74.h,
                                width: 74.w,
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  border: Border.all(color: borderColor),
                                ),
                                child: Image(image: image),
                              ),
                        ),
                        SizedBox(height: 8.h,),
                        Text(data.getData![index].categoryName!.length>5?data.getData![index].categoryName!.substring(0,6)+"..":data.getData![index].categoryName!, style: mediumText(
                            14.sp, color: appBarTitleTextColor),)
                      ],
                    );
                  }
              );
            },
          ),
        ],
      ),
    );
  }
}
