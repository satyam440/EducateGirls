import 'dart:convert';

import 'package:educategirl/Models/TblUserInfoEntity.dart';
import 'package:educategirl/Models/TblUserLoginEntity.dart';
import 'package:educategirl/SarvekshanDataHandler/sarvekshan.dart';
import 'package:educategirl/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/ApiResponse.dart';
import '../Database/DatabaseHandler.dart';
import '../Screens/dashboard.dart';
import '../helper/helper.dart';

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({super.key});

  @override
  _LoginPageNewState createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final LoginService _apiService = LoginService();
  DatabaseHelper databaseHelper=DatabaseHelper();


  bool isLoading = false;
  bool _obscureText = true;



 void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final user = await _apiService.getUserLogin(
        _nameController.text,
        _passwordController.text,
      );
      if (user.statusCode == 200) {
         await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(_nameController.text);
        user.body;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else if (user.statusCode == 401 && _nameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        _showErrorDialog("उपयोगकर्ता नाम और पासवर्ड गलत है");
      }
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
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.black, fontSize: 17.sp),
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
                      style: TextStyle(color: Colors.white, fontSize: 17.sp),
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
    if (_nameController.text.isEmpty && _passwordController.text.isEmpty) {
      _showErrorDialog('कृपया उपयोगकर्ता नाम और पासवर्ड दर्ज करें');
    } else if(_nameController.text.isEmpty) {
      _showErrorDialog("उपयोगकर्ता नाम दर्ज करें");
    } else if(_passwordController.text.isEmpty) {
      _showErrorDialog("पासवर्ड दर्ज करें");
    } else {
      _login();
    }
  }


  // void _validateAndLogin() async {
  //   // Perform username and password validation
  //   if (_nameController.text.isEmpty || _passwordController.text.isEmpty) {
  //     _showErrorDialog('कृपया उपयोगकर्ता नाम और पासवर्ड दर्ज करें');
  //   } else {
  //     _login();
  //   }
  // }

  // } else if (int.parse(_nameController.text) != ) {
  // } else if (_passwordController.text != _apiService.userId.toString() && _nameController.text != _apiService.password.toString()) {
  //   _showErrorDialog('उपयोगकर्ता नाम और पासवर्ड गलत है');
  // } else if (_nameController.text != _apiService.password.toString()) {
  //   _showErrorDialog('उपयोगकर्ता नाम गलत है');
  // } else if (_passwordController.text != _apiService.userId.toString()) {
  //   _showErrorDialog('पासवर्ड गलत है');
  // } else {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/hh.jpg'),
          fit: BoxFit.fitHeight,
        )),
        //margin: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 105.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.h),
                child: Image(
                  image: const AssetImage("assets/logo_edugal.png"),
                  height: 150.h,
                  width: 150.w,
                ),
              ),
              SizedBox(height: 30.0.h),
              element("उपयोगकर्ता नाम", Icons.person, _nameController, false),
              SizedBox(height: 16.0.h),
              element("पासवर्ड", Icons.lock, _passwordController, _obscureText),
              SizedBox(height: 5.0.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 50.w,
                  ),
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                        value: !_obscureText,
                        checkColor: Colors.white54,
                        onChanged: (val) {
                          setState(() {
                            _obscureText = !val!;
                          });
                        },
                        fillColor:
                            MaterialStateProperty.all(Colors.red.shade700)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.h),
                    child: Text(
                      "पासवर्ड दिखायें?",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0.h),
              Container(
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 50.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: _validateAndLogin,
                  child: Center(
                    child: Text(
                      'लॉग इन',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Version 1.0",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget element(String s, IconData iconData, TextEditingController control,
      bool obscureText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(
                child: Icon(
              iconData,
              color: const Color.fromARGB(255, 60, 61, 60),
            )),
          ),
          Expanded(
              child: TextFormField(
                onTap: () async {
                  String id = _nameController.text;
                  await databaseHelper.saveUserId(id);
                  },
            obscureText: obscureText,
            keyboardType: TextInputType.number,
            controller: control,
            style: const TextStyle(color: Colors.black54),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: s,
              contentPadding: EdgeInsets.only(left: 13.w),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.w)),
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              border: const OutlineInputBorder(),
            ),
          )),
        ],
      ),
    );
  }
}
