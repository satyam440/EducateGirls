import 'package:educategirl/Widgets/namankan.dart';
import 'package:educategirl/SarvekshanDataHandler/sarvekshan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_menu.dart';
import 'namankan_suchi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          backgroundColor: Colors.red.shade700,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w, top: 4.h, bottom: 4.h),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/logo_edugal.png"),
            ),
          ),
          actions: const <Widget>[
            CustomMenu(),
          ],
          leadingWidth: 50.w,
          title: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: const Text(
              "होम पेज",
            ),
          ),
          centerTitle: true,

        ),
      ),
      // endDrawer: const TopToBottomSlider(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image:
            DecorationImage(image: AssetImage("assets/egtp_bg.png"), fit: BoxFit.cover)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.h,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.w,
                      color: Colors.black26,
                  ),
                  // borderRadius: BorderRadius.all(Radius.circular(50))
                ),
              child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Sarvekshan()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(
                          "assets/images/dtd_new.png",
                        ),
                        width: 115.w,
                        height: 115.h,
                      ),
                      Text(
                        "D2D सर्वेक्षण",
                        style: TextStyle(
                            fontSize: 20.sp,
                          color: Colors.red
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Container(
              height: 160.h,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.w,
                      color: Colors.black26,
                  ),
                  // borderRadius: BorderRadius.all(Radius.circular(50))
                ),
              child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NamankanSuchi()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(
                          "assets/images/enrollment_new.png",
                        ),
                        width: 115.w,
                        height: 110.h,
                      ),
                      Text(
                        "नामांकन",
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}



