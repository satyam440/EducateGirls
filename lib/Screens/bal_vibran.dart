import 'package:educategirl/Screens/gharelu_vibran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';

class AddChild extends StatefulWidget {

  String name;
  String fathers;

  AddChild({super.key,required this.name,required this.fathers});

  @override
  State<AddChild> createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {

  int selectedRadio = 0;
  String selectedValue = 'चयन करें';
  final List<String> _options = [
    'चयन करें',
    'बालक',
    'बालिका',
    'ट्रांसजेंडर',
  ];

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
                "बाल विबरण",
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
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HH नंबर",
                            style:
                            TextStyle(fontSize: 15.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 112.w,
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
                              decoration: InputDecoration(
                                label: Text(widget.name.toString()),
                                  contentPadding: const EdgeInsets.all(10),
                                  border: const OutlineInputBorder(
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
                          horizontal: 11.w, vertical: 2.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "पिता का नाम",
                            style:
                            TextStyle(fontSize: 15.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 91.w,
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
                              decoration: InputDecoration(
                                  label: Text(widget.fathers.toString()),
                                  contentPadding: EdgeInsets.all(10),
                                  border: const OutlineInputBorder(
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
                      EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*बच्चों का नाम लिखें?",
                            style:
                            TextStyle(fontSize: 15.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 45.w,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.w, vertical: 2.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*बच्चों का लिंग चुने?",
                            style: TextStyle(
                                fontSize: 15.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 53.w,
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
                          horizontal: 11.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Text(
                            "*क्या बच्चों का जन्मतिथी\nउपलब्ध है?",
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
                                horizontal: 11.w, vertical: 2.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*बच्चे का जन्मतिथि क्या है?",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 12.w,
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
                                horizontal: 11.w, vertical: 10.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "बच्चे की आयु",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 92.w,
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
                            padding:
                            EdgeInsets.symmetric(horizontal: 11.w, vertical: 1.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "*बच्चों का आयु दर्ज करें(पूरे\nहुए सालों में)",
                                  style:
                                  TextStyle(fontSize: 15.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 14.w,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewHome()));
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
                child:  Text('Close'),
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
