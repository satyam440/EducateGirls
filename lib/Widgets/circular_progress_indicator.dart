import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularCard extends StatelessWidget {


  CircularCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 22.h, vertical: 285.w),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 35.h,
                    width: 35.w,
                    child: const Image(image: AssetImage("assets/logo_edugal.png"), fit: BoxFit.cover,)),
                SizedBox(width: 13.w),
                Text(
                  "Digital Praveshotsav",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircularProgressIndicator(
                  color: Colors.teal,
                  // value: 0.7,
                  strokeWidth: 3.w,
                ),
                SizedBox(width: 40.w,),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Text(
                    "डेटा डाउनलोड हो रहा है...",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
