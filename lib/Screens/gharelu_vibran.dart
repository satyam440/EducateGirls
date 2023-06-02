import 'package:educategirl/SarvekshanDataHandler/data_model.dart';
import 'package:educategirl/SarvekshanDataHandler/display_data_screen_sarvekshan.dart';
import 'package:educategirl/SarvekshanDataHandler/sarvekshan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'alert_box.dart';
import 'bal_vibran.dart';
import 'home_page.dart';

class AddNewHome extends StatefulWidget {
  const AddNewHome({Key? key}) : super(key: key);

  @override
  State<AddNewHome> createState() => _AddNewHomeState();
}

class _AddNewHomeState extends State<AddNewHome> {
  int selectedRadio = 0;
  String selectedValue = 'चयन करें';
  final List<String> _options = [
    'चयन करें',
    'हिंदू',
    'मुस्लिम',
    'ईसाई',
    'सिख',
    'बौद्ध',
    'जैन',
    'अन्य',
    'बताने की इच्छा नहीं',
  ];
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

  TextEditingController hhNumberController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController mohallaNameController = TextEditingController();
  TextEditingController homeNumberController = TextEditingController();

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
                "घरेलु विवरण",
                style: TextStyle(fontSize: 17.sp),
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/egtp_bg.png"), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.w, vertical: 12.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*मोहल्ला/फलिया का नाम\nलिखे|",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            height: 38.h,
                            width: 170.w,
                            color: Colors.transparent,
                            child: TextField(
                              controller: mohallaNameController,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
                              ),
                              cursorColor: Colors.red.shade700,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  )),
                              onTap: () {},
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 1.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*मकान शंख्या दर्ज करें",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 39.w,
                          ),
                          Container(
                            height: 38.h,
                            width: 170.w,
                            color: Colors.transparent,
                            child: TextField(
                              controller: homeNumberController,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
                              ),
                              cursorColor: Colors.red.shade700,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  )),
                              onTap: () {},
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
                          horizontal: 11.w, vertical: 12.h),
                      child: Row(
                        children: [
                          Text(
                            "*क्या इस घर में 0-18 आयु\nवर्ग के कोई बच्चे है?",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Transform.scale(
                              scale: 1.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: selectedRadio,
                                    fillColor: MaterialStateProperty.all(
                                        Colors.red.shade700),
                                    onChanged: (val) {
                                      setSelectedRadio(val as int);
                                    },
                                  ),
                                  Text(
                                    'हाँ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Transform.scale(
                              scale: 1.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 2,
                                    fillColor: MaterialStateProperty.all(
                                        Colors.red.shade700),
                                    groupValue: selectedRadio,
                                    onChanged: (val) {
                                      setSelectedRadio(val as int);
                                    },
                                  ),
                                  Text(
                                    'नहीं',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: selectedRadio == 1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11.w, vertical: 7.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*बच्चे की माता पिता\nअभिभावक का नाम क्या है?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.transparent,
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )),
                                    onTap: () {},
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
                                horizontal: 8.w, vertical: 5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*माता महिला अभिजभावक\nका रिश्ता?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.transparent,
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )),
                                    onTap: () {},
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
                                horizontal: 11.w, vertical: 5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*बच्चे के पिता/पुरुष\nअभिभावक (संरक्षक) का\n नाम क्या है?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 26.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.transparent,
                                  child: TextField(
                                    controller: fatherNameController,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )),
                                    onTap: () {},
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
                                horizontal: 11.w, vertical: 5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*पिता पुरुष अभिभावक\nका रिश्ता",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 35.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.transparent,
                                  child: TextField(

                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )),
                                    onTap: () {},
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
                                horizontal: 11.w, vertical: 5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "*अभिभावक मोबाइल नंबर",
                                      style: TextStyle(
                                          fontSize: 15.sp, color: Colors.black),
                                    ),
                                    Text(
                                      "यदि कोई मोबाइल नंबर उपलब्ध नही है\nतो 111 दर्ज करें",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black54),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.transparent,
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )),
                                    onTap: () {},
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
                                horizontal: 11.w, vertical: 5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*धर्म क्या है?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 94.w,
                                ),
                                SizedBox(
                                  width: 170.w,
                                  // adjust the width of the container as needed
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        hintText: "  चयन करें",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 1),
                                        border: OutlineInputBorder(),
                                      ),
                                      items: _options
                                          .map((option) =>
                                              DropdownMenuItem<String>(
                                                value: option,
                                                child: Text(
                                                  option,
                                                  style: TextStyle(
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
                                horizontal: 11.w, vertical: 8.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*सामाजिक वर्ग क्या है?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 36.w,
                                ),
                                SizedBox(
                                  width: 170.w,
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
                          SizedBox(
                            width: 190.w,
                          ),
                          Text(
                            "बच्चा जोड़े",
                            style: TextStyle(
                                color: Colors.red.shade700, fontSize: 21.sp),
                          ),
                          TextButton(
                            onPressed: () {
                              String hName = hhNumberController.text;
                              String father = fatherNameController.text;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddChild(fathers: father, name: hName,)));
                            },
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/plus.png"),
                              backgroundColor: Colors.white,
                              radius: 25,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: selectedRadio == 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/egtp_bg.png"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
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
                    height: 37.h,
                    child: ElevatedButton(
                      onPressed: () {
                        final mohallaName = mohallaNameController.text;
                        final homeNumber = homeNumberController.text;
                        final fatherName = fatherNameController.text;
                        final hhNumber = hhNumberController.text;
                        final dataPass = DataModel(homeNumber, mohallaName, hhNumber, fatherName, );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Sarvekshan(data: dataPass,)));

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
                        "सहेजें",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  SizedBox(
                    width: 140.w,
                    height: 37.h,
                    child: ElevatedButton(
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
                                        "कृपया बच्चों को जोड़े",
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
                                          Navigator.pop(context);
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
        ));
  }

  Set<Future> alertBox() {
    return {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text('This is an alert box popup.'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
    };
  }
}
