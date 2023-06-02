import 'package:educategirl/Authentication/login_page_new.dart';
import 'package:educategirl/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Database/DatabaseHandler.dart';
import '../Models/TblUserInfoEntity.dart';
import '../Widgets/circular_progress_indicator.dart';
import '../helper/helper.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String userName = "";

  LoginPageNew loginInstance = LoginPageNew();
  String selectedValue = 'चयन करें';
  bool dataDownlaod = false;
  final List<String> _options = [
    'चयन करें',
    'चयन',
    'चयनरें',
    'चयन कं',
  ];

  final _formKey = GlobalKey<FormState>();
  TextEditingController tokenController = TextEditingController();
  TextEditingController diseCodeController = TextEditingController();
  TextEditingController teacherNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController otherDesignationController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  LoginPageNew loginData = const LoginPageNew();
  bool isEditing = false;


  void saveData() async {
    if (_formKey.currentState!.validate()) {
      TblUserInfoEntity data = TblUserInfoEntity(
        // token: tokenController.text,
        dISECode: diseCodeController.text,
        teacherName: teacherNameController.text,
        designation: designationController.text,
        otherDesignation: otherDesignationController.text,
        emailId: emailIdController.text,
        mobileNo: mobileNumberController.text,
      );
      int id = await databaseHelper.insertUserInfoEntity(data);
      print('Inserted row with id in Dashboard UI: $id');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
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
                    message,
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
  }


  void _validateAndLogin() async {
    // Perform username and password validation

    if (diseCodeController.text.isNotEmpty && teacherNameController.text.isNotEmpty && designationController.text.isNotEmpty && otherDesignationController.text.isNotEmpty && mobileNumberController.text.isNotEmpty && emailIdController.text.isNotEmpty ) {
      _showErrorDialog('डेटा डाउनलोड हो गया है');
    }
    else if (teacherNameController.text.isEmpty) {
      _showErrorDialog('कृपया शिक्षक का नाम दर्ज करें');
    }
    else if (mobileNumberController.text.isEmpty) {
      _showErrorDialog('कृपया mobile No दर्ज करें');
    }
    else if (emailIdController.text.isEmpty) {
      _showErrorDialog('कृपया Email ID दर्ज करें');
    }
    else if(diseCodeController.text.isEmpty) {
      // if(diseCodeController.text.length < 10) {
      //   _showErrorDialog('diseCode गलत है');
      // }
      _showErrorDialog('कृपया diseCode दर्ज करें');
    }
    // else if (designationController.text.isEmpty) {
    //   _showErrorDialog('कृपया designation नाम दर्ज करें');
    // }
    // else if (otherDesignationController.text.isEmpty) {
    //   _showErrorDialog('कृपया other पदनाम दर्ज करें');
    // }
    else {
      saveData();
      _showErrorDialog('डेटा डाउनलोड हो गया');
      setState(() {
        dataDownlaod = true;
      });
    }
  }

    @override
  void initState() {
    super.initState();
    gettingUserData();
  }
  
  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      if (value != null) {
        setState(() {
          userName = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(42.h),
            child: AppBar(
              backgroundColor: Colors.red.shade700,
              leading: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/logo_edugal.png"),
                ),
              ),
              leadingWidth: 45.w,
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 47.w),
                child: Text(
                  "गाओं और उपयोगकर्ता विबरण",
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/egtp_bg.png"))),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 18.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "उपयोगकर्ता नाम",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 39.w,
                          ),
                          Container(
                            height: 38.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black,
                            )),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                userName,
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*अध्यापक का नाम",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 31.w,
                          ),
                          Container(
                            height: 38.h,
                            width: 170.w,
                            color: Colors.transparent,
                            child: TextField(
                              keyboardType: TextInputType.name,
                              controller: teacherNameController,
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*पद",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 117.w,
                          ),
                          SizedBox(
                            width: 170.w,
                            // adjust the width of the container as needed
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  hintText: "  चयन करें",
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  border: OutlineInputBorder(),
                                ),
                                items: _options
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: TextStyle(color: Colors.black),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*मोबाइल नंबर",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 59.w,
                          ),
                          Container(
                            height: 38.h,
                            width: 170.w,
                            color: Colors.transparent,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: mobileNumberController,
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*ईमेल आईडी",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 64.w,
                          ),
                          Container(
                            height: 38.h,
                            width: 170.w,
                            color: Colors.transparent,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailIdController,
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*Dise कोड",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 74.w,
                          ),
                          Container(
                            height: 38.h,
                            width: 170.w,
                            color: Colors.transparent,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: diseCodeController,
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*विद्यालय का नाम",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 38.w,
                          ),
                          SizedBox(
                            width: 170.w,
                            // adjust the width of the container as needed
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  hintText: "  चयन करें",
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  border: OutlineInputBorder(),
                                ),
                                items: _options
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: TextStyle(color: Colors.black),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*राज्य",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 106.w,
                          ),
                          SizedBox(
                            width: 170.w,
                            // adjust the width of the container as needed
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  hintText: "  चयन करें",
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  border: OutlineInputBorder(),
                                ),
                                items: _options
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: TextStyle(color: Colors.black),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*जिला",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 104.w,
                          ),
                          SizedBox(
                            width: 170.w,
                            // adjust the width of the container as needed
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  hintText: "  चयन करें",
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  border: OutlineInputBorder(),
                                ),
                                items: _options
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: TextStyle(color: Colors.black),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*खंड",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 112.w,
                          ),
                          SizedBox(
                            width: 170.w,
                            // adjust the width of the container as needed
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  hintText: "  चयन करें",
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  border: OutlineInputBorder(),
                                ),
                                items: _options
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: TextStyle(color: Colors.black),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*पंचायत",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 92.w,
                          ),
                          SizedBox(
                            width: 170.w,
                            // adjust the width of the container as needed
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  hintText: "  चयन करें",
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  border: OutlineInputBorder(),
                                ),
                                items: _options
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: TextStyle(color: Colors.black),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "*ग्राम का नाम",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                          SizedBox(
                            width: 64.w,
                          ),
                          SizedBox(
                            width: 170.w,
                            // adjust the width of the container as needed
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  hintText: "  चयन करें",
                                  hintStyle: TextStyle(color: Colors.black),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  border: OutlineInputBorder(),
                                ),
                                items: _options
                                    .map((option) => DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: TextStyle(color: Colors.black),
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
                    SizedBox(
                      height: 18.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70.h,
                // width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 140.w,
                      height: 37.h,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        // onPressed: () async {
                        //   // if (_formKey.currentState!.validate()) {
                        //   //   TblUserInfoEntity data = TblUserInfoEntity(
                        //   //     // token: tokenController.text,
                        //   //     dISECode: diseCodeController.text,
                        //   //     teacherName: teacherNameController.text,
                        //   //     designation: designationController.text,
                        //   //     otherDesignation: otherDesignationController.text,
                        //   //     emailId: emailIdController.text,
                        //   //     mobileNo: mobileNumberController.text,
                        //   //   );
                        //   //   int id = await databaseHelper.insertUserInfoEntity(data);
                        //   //
                        //   //   print('Inserted row with id: $id');
                        //   // }
                        //
                        // },
                        onPressed: _validateAndLogin,
                        child: Text(
                          "डेटा डाउनलोड",
                          style: TextStyle(
                              fontSize: 17.sp,
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
                          if(dataDownlaod == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          } else {
                            _showErrorDialog("कृपया डेटा डाउनलोड करें");
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "लॉग इन",
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
