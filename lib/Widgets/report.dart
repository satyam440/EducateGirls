import 'package:educategirl/Screens/gharelu_vibran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screens/bal_namakan.dart';
import '../Screens/home_page.dart';


class Report extends StatefulWidget {
  const Report({super.key});


  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {


  int selectedRadio = 0;
  final List<String> _optionsTwo = [
    'चयन करें',
    'यस.सी.',
    'यस.टी.',
    'ओं.बी.सी.',
    'यस.सी.',
    'सामान्य',
    'अल्पसंख्यक',
    'एस.बी.सी.',
    'बताने की इच्छा नहीं',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          backgroundColor: Colors.red.shade700,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo_edugal.png"),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.red.shade700)),
                child: const Icon(
                  Icons.home,
                  size: 34,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              ),
            )
          ],
          leadingWidth: 50,
          title: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              "रिपोर्ट",
              style: TextStyle(fontSize: 17.sp),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/egtp_bg.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 18.h,
              ),
              Row(
                children: [
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,
                      color: Colors.red.shade700,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "फार्म का नाम",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w,),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,
                      color: Colors.red.shade700,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "कुल",style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w,),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,
                      color: Colors.red.shade700,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "अपलोड",style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w,),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,
                      color: Colors.red.shade700,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "लंबित",style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w,)
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "हाउसहोल्ड",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "2",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17.sp,

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "2",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w,)
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BalNamakan()));
                            },
                            child: Text(
                              "बच्चे",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BalNamakan()));
                            },
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.sp,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BalNamakan()));
                            },
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BalNamakan()));
                            },
                            child: Text(
                              "0",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w,),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BalNamakan()));
                            },
                            child: Text(
                              "नामांकन",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BalNamakan()));
                            },
                            child: Text(
                              "0",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.sp,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BalNamakan()));
                            },
                            child: Text(
                              "0",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,

                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black26)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BalNamakan()));
                            },
                            child: Text(
                              "0",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w,)
                ],
              ),
            ],
          )
      ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70.h,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage("assets/egtp_bg.png"),
                      fit: BoxFit.cover
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 140.w,
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade700),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "बंद करें",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );

  }
}
