import 'package:educategirl/Authentication/login_page.dart';
import 'package:educategirl/Screens/dashboard.dart';
import 'package:educategirl/Screens/home_page.dart';
import 'package:educategirl/Widgets/report.dart';
import 'package:educategirl/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Authentication/login_page_new.dart';
import '../Widgets/add_gaon.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});



  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            height: 200.h,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 51.h,
                                  width: double.infinity,
                                  color: Colors.red.shade700,
                                  child: Center(
                                    child: Text(
                                      "Digital Praveshotsav",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.sp),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Center(
                                  child: Text(
                                    "डेटा डाउनलोड किया गया",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 44.h,
                                ),
                                Container(
                                  height: 37.h,
                                  width: 135.w,
                                  decoration: BoxDecoration(
                                      color: Colors.red.shade700,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    },
                                    child: Text(
                                      'ठीक है',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/downloads.png"),
                        width: 30.w,
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "डेटा डाउनलोड",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17.sp),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            height: 200.h,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 51.h,
                                  width: double.infinity,
                                  color: Colors.red.shade700,
                                  child: Center(
                                    child: Text(
                                      "Digital Praveshotsav",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.sp),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Center(
                                  child: Text(
                                    "अपलोड के लिए कुछ नहीं है",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 44.h,
                                ),
                                Container(
                                  height: 37.h,
                                  width: 135.w,
                                  decoration: BoxDecoration(
                                      color: Colors.red.shade700,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    },
                                    child: Text(
                                      'ठीक है',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/upload.png"),
                        width: 30.w,
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          "डेटा सिंक",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17.sp),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                TextButton(
                  onPressed: () {
                    const CircularProgressIndicator();

                    // Future.delayed(const Duration(milliseconds: 300), () {
                    //   // Do something
                    //
                    // });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Report()));
                  },
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/reporticon.png"),
                        width: 30.w,
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          "रिपोर्ट",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17.sp),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddGaon()));
                  },
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/downloads.png"),
                        width: 30.w,
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "गाँव जोडें",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17.sp),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                TextButton(
                  onPressed: ()  {
                    // final SharedPreferences prefs = await SharedPreferences.getInstance();
                    // await prefs.setBool('isLoggedIn', false);
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => LoginPageNew()));
                    signOut();
                           Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPageNew()),
                                (route) => false);
                  },
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/downloads.png"),
                        width: 30.w,
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "लॉगआउट",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17.sp),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // const PopupMenuItem(
          //   value: 'item2',
          //   child: ListTile(
          //     leading: Icon(Icons.settings),
          //     title: Text('Settings'),
          //   ),
          // ),
          // const PopupMenuItem(
          //   value: 'item3',
          //   child: ListTile(
          //     leading: Icon(Icons.notifications),
          //     title: Text('Notifications'),
          //   ),
          // ),
          // const PopupMenuItem(
          //   value: 'item4',
          //   child: ListTile(
          //     leading: Icon(Icons.help),
          //     title: Text('Help'),
          //   ),
          // ),
          // const PopupMenuItem(
          //   value: 'item5',
          //   child: ListTile(
          //     leading: Icon(Icons.logout),
          //     title: Text('Logout'),
          //   ),
          // ),
        ];
      },
      icon: const Icon(
        Icons.menu,
        size: 33,
      ),
      // Menu icon
      offset: const Offset(0, 50),
      // Position of the menu relative to the icon
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      // Background color of the menu
      elevation: 0,
      // Remove background blur
      onSelected: (value) {
        // Handle selected menu item
      },
    );
  }
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
    } catch (e) {
      return null;
    }
  }
}
