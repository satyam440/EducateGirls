import 'package:educategirl/Screens/gharelu_vibran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screens/home_page.dart';


class AddGaon extends StatefulWidget {
  const AddGaon({super.key});


  @override
  State<AddGaon> createState() => _AddGaonState();
}

class _AddGaonState extends State<AddGaon> {


  int selectedRadio = 0;
  final List<String> _optionsTwo = [
    'चयन करें',
    'यस.सी.',
    'यस.टी.',
    'ओं.बी.सी.',
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
                "नया गाँव जोड़े",
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
                height: 9.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.w, vertical: 7.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "राज्य",
                          style:
                          TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        SizedBox(
                          width: 80.w,
                        ),
                        SizedBox(
                          width: 195.w,
                          // adjust the width of the container as needed
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                hintText: '  चयन करें',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 1),
                                border: OutlineInputBorder(),
                              ),
                              items: _optionsTwo
                                  .map((option) =>
                                  DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                          color: Colors.black),
                                    ),
                                  ))
                                  .toList(),
                              onChanged: (selectedValue) {
                                // do something with the selected option
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.w, vertical: 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "जिला",
                          style:
                          TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        SizedBox(
                          width: 76.w,
                        ),
                        SizedBox(
                          width: 195.w,
                          // adjust the width of the container as needed
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                hintText: '  चयन करें',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 1),
                                border: OutlineInputBorder(),
                              ),
                              items: _optionsTwo
                                  .map((option) =>
                                  DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                          color: Colors.black),
                                    ),
                                  ))
                                  .toList(),
                              onChanged: (selectedValue) {
                                // do something with the selected option
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.w, vertical: 7.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "खंड",
                          style:
                          TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        SizedBox(
                          width: 85.w,
                        ),
                        SizedBox(
                          width: 195.w,
                          // adjust the width of the container as needed
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                hintText: '  चयन करें',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 1),
                                border: OutlineInputBorder(),
                              ),
                              items: _optionsTwo
                                  .map((option) =>
                                  DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                          color: Colors.black),
                                    ),
                                  ))
                                  .toList(),
                              onChanged: (selectedValue) {
                                // do something with the selected option
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.w, vertical: 7.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "पंचायत",
                          style:
                          TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        SizedBox(
                          width: 66.w,
                        ),
                        SizedBox(
                          width: 195.w,
                          // adjust the width of the container as needed
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                hintText: '  चयन करें',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 1),
                                border: OutlineInputBorder(),
                              ),
                              items: _optionsTwo
                                  .map((option) =>
                                  DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                          color: Colors.black),
                                    ),
                                  ))
                                  .toList(),
                              onChanged: (selectedValue) {
                                // do something with the selected option
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.w, vertical: 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ग्राम का नाम",
                          style:
                          TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        SizedBox(
                          width: 39.w,
                        ),
                        SizedBox(
                          width: 195.w,
                          // adjust the width of the container as needed
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                hintText: '  चयन करें',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 1),
                                border: OutlineInputBorder(),
                              ),
                              items: _optionsTwo
                                  .map((option) =>
                                  DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                          color: Colors.black),
                                    ),
                                  ))
                                  .toList(),
                              onChanged: (selectedValue) {
                                // do something with the selected option
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120.w,
                    height: 37.h,
                    child: ElevatedButton(
                      onPressed: () {},
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
                        "गाँव जोडें",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120.w,
                    height: 37.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const HomePage()));
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
                        "गाँव मिटाओ",
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
    );
  }
}
