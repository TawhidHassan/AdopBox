import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../Data/Model/PostCreate/PostCreate.dart';

class Draftcard extends StatelessWidget {
  final PostCreate? postCreate;
  const Draftcard({Key? key, this.postCreate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      height: 78,
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0xFFB4C2D4)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Draft Post',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Maven Pro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Date : '+DateFormat("MMM-dd-yyy h:mm a").format(DateTime.fromMillisecondsSinceEpoch(postCreate!.uniqueId!.toInt()).toLocal()),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Maven Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 96),
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: ShapeDecoration(
              color: Color(0xFF7C26E7),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Maven Pro',
                    fontWeight: FontWeight.w600,

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
