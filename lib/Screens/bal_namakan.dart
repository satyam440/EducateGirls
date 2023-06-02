import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'alert_box.dart';
import 'bal_vibran.dart';
import 'home_page.dart';
import 'namankan_suchi.dart';
import 'package:intl/intl.dart';

class BalNamakan extends StatefulWidget {
  const BalNamakan({Key? key}) : super(key: key);

  @override
  State<BalNamakan> createState() => _BalNamakanState();
}

class _BalNamakanState extends State<BalNamakan> {

  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat.yMd().format(_selectedDate!);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int selectedRadio = -1;
  int selectedRadioOne = -1;
  int selectedRadioTwo = -1;
  String selectedValue = 'चयन करें';
  final List<String> _options = [
    'चयन करें',
    'बालक',
    'बालिका',
    'ट्रांसजेंडर',
  ];
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

  TextEditingController hhNumber = TextEditingController();
  TextEditingController fatherName = TextEditingController();

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioOne(int val) {
    setState(() {
      selectedRadioOne = val;
    });
  }

  setSelectedRadioTwo(int val) {
    setState(() {
      selectedRadioTwo = val;
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
                "बाल नामांकन",
                style: TextStyle(fontSize: 17.sp),
              ),
            ),
            centerTitle: true,
          ),
        ),
        // resizeToAvoidBottomInset: false,
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
                            "*बच्चे का नाम लिखे",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 54.w,
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
                                items: _options
                                    .map((option) => DropdownMenuItem<String>(
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
                          horizontal: 11.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Text(
                            "*क्या बच्चे की जन्म तिथि\nउपलब्ध है?",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
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
                                      // selectedRadio = 3;
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
                                      // selectedRadio = 4;
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
                                  "*बच्चे की जन्म तिथि क्या है?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.transparent,
                                  child: TextField(
                                    controller: _controller,
                                    onTap: () => _selectDate(context),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),

                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.calendar_month_sharp,
                                            size: 29,
                                            color: Colors.red.shade700,
                                          ),
                                          onPressed: () => _selectDate(context),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        )),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "बच्चे की आयु",
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 84.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.black26,
                                  child: TextField(
                                    readOnly: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: const InputDecoration(
                                        label: Text("0"),
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
                                horizontal: 11.w, vertical: 7.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*बच्चे की माता/महिला\nअभिभावक का नाम क्या है?",
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
                                Container(
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "*D2D के अनुसार शिक्षा\nकी स्थिति",
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 28.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.black26,
                                  child: TextField(
                                    readOnly: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: const InputDecoration(
                                        label: Text("चयन करें"),
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
                                horizontal: 11.w, vertical: 10.h),
                            child: Row(
                              children: [
                                Text(
                                  "*क्या इस बच्चे का नामांकन\nहो गया?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Transform.scale(
                                    scale: 1.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                          toggleable: false,
                                          value: 3,
                                          groupValue: selectedRadioOne,
                                          fillColor: MaterialStateProperty.all(
                                              Colors.red.shade700),
                                          onChanged: (val) {
                                            setSelectedRadioOne(val as int);
                                          },
                                        ),
                                        Text(
                                          'हाँ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                          toggleable: false,
                                          value: 4,
                                          fillColor: MaterialStateProperty.all(
                                              Colors.red.shade700),
                                          groupValue: selectedRadioOne,
                                          onChanged: (val) {
                                            setSelectedRadioOne(val as int);
                                          },
                                        ),
                                        Text(
                                          'नहीं',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp),
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
                        visible: selectedRadioOne == 3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11.w, vertical: 10.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        "*क्या बच्चे का आधार कार्ड\nउपलब्ध है?",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.black),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 23.w),
                                        child: Transform.scale(
                                          scale: 1.4,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                toggleable: false,
                                                value: 6,
                                                groupValue: selectedRadioTwo,
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red.shade700),
                                                onChanged: (val) {
                                                  setSelectedRadioTwo(
                                                      val as int);
                                                },
                                              ),
                                              Text(
                                                'हाँ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                toggleable: false,
                                                value: 7,
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red.shade700),
                                                groupValue: selectedRadioTwo,
                                                onChanged: (val) {
                                                  setSelectedRadioTwo(
                                                      val as int);
                                                },
                                              ),
                                              Text(
                                                'नहीं',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp),
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
                            // Row(
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: 11.w, vertical: 5.h),
                            //       child: Row(
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Text(
                            //             "*बच्चे के पिता/पुरुष\nअभिभावक (संरक्षक) का\n नाम क्या है?",
                            //             style: TextStyle(
                            //                 fontSize: 15.sp, color: Colors.black),
                            //           ),
                            //           SizedBox(
                            //             width: 26.w,
                            //           ),
                            //           Container(
                            //             height: 38.h,
                            //             width: 170.w,
                            //             color: Colors.transparent,
                            //             child: TextField(
                            //               style: TextStyle(
                            //                 color: Colors.black,
                            //                 fontSize: 17.sp,
                            //               ),
                            //               cursorColor: Colors.red.shade700,
                            //               decoration: const InputDecoration(
                            //                   contentPadding: EdgeInsets.all(10),
                            //                   border: OutlineInputBorder(
                            //                     borderSide:
                            //                     BorderSide(color: Colors.black),
                            //                   )),
                            //               onTap: () {},
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: 11.w, vertical: 7.h),
                            //       child: Row(
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Text(
                            //             "*बच्चे की माता/महिला\nअभिभावक का नाम क्या है?",
                            //             style: TextStyle(
                            //                 fontSize: 15.sp, color: Colors.black),
                            //           ),
                            //           SizedBox(
                            //             width: 10.w,
                            //           ),
                            //           Container(
                            //             height: 38.h,
                            //             width: 170.w,
                            //             color: Colors.transparent,
                            //             child: TextField(
                            //               style: TextStyle(
                            //                 color: Colors.black,
                            //                 fontSize: 17.sp,
                            //               ),
                            //               cursorColor: Colors.red.shade700,
                            //               decoration: const InputDecoration(
                            //                   contentPadding: EdgeInsets.all(10),
                            //                   border: OutlineInputBorder(
                            //                     borderSide:
                            //                     BorderSide(color: Colors.black),
                            //                   )),
                            //               onTap: () {},
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: selectedRadioOne == 5,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11.w, vertical: 5.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "*अभिभावक मोबाइल नंबर",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black),
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
                                              contentPadding:
                                                  EdgeInsets.all(10),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              )),
                                          onTap: () {},
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: selectedRadio == 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 11.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*बच्चे की आयु दर्ज करें (पुरे\nहुए सालों में)",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.transparent,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
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
                                  "*बच्चे की माता/महिला\nअभिभावक का नाम क्या है?",
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
                                  "*सामाजिक वर्ग क्या है?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 36.w,
                                ),
                                Container(
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 5.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "D2D के अनुसार शिक्षा\nकी स्तिथि",
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 36.w,
                                ),
                                Container(
                                  height: 38.h,
                                  width: 170.w,
                                  color: Colors.black26,
                                  child: TextField(
                                    readOnly: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                    cursorColor: Colors.red.shade700,
                                    decoration: const InputDecoration(
                                        label: Text("चयन करें"),
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
                                horizontal: 11.w, vertical: 10.h),
                            child: Row(
                              children: [
                                Text(
                                  "*क्या इस बच्चे का नामांकन\nहो गया?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Transform.scale(
                                    scale: 1.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              color: Colors.black,
                                              fontSize: 11.sp),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              color: Colors.black,
                                              fontSize: 11.sp),
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
                      // Visibility(
                      //   visible: selectedRadio == 4,
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Padding(
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 11.w, vertical: 5.h),
                      //             child: Row(
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Text(
                      //                   "*सामाजिक वर्ग क्या है?",
                      //                   style: TextStyle(
                      //                       fontSize: 15.sp, color: Colors.black),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 36.w,
                      //                 ),
                      //                 Container(
                      //                   width: 170.w,
                      //                   // adjust the width of the container as needed
                      //                   child: ButtonTheme(
                      //                     alignedDropdown: true,
                      //                     child: DropdownButtonFormField<String>(
                      //                       decoration: const InputDecoration(
                      //                         hintText: '  चयन करें',
                      //                         hintStyle: TextStyle(
                      //                           color: Colors.black,
                      //                         ),
                      //                         contentPadding:
                      //                         EdgeInsets.symmetric(horizontal: 1),
                      //                         border: OutlineInputBorder(),
                      //                       ),
                      //                       items: _optionsTwo
                      //                           .map((option) =>
                      //                           DropdownMenuItem<String>(
                      //                             value: option,
                      //                             child: Text(
                      //                               option,
                      //                               style: const TextStyle(
                      //                                   color: Colors.black),
                      //                             ),
                      //                           ))
                      //                           .toList(),
                      //                       onChanged: (selectedValue) {
                      //                         // do something with the selected option
                      //                       },
                      //                     ),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
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
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 140.w,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NamankanSuchi()));
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
