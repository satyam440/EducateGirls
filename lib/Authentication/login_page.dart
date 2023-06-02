import 'dart:convert';
import 'package:educategirl/Models/TblUserLoginEntity.dart';
import 'package:educategirl/SarvekshanDataHandler/sarvekshan.dart';
import 'package:educategirl/Screens/namankan_suchi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../Api/ApiResponse.dart';
import '../Database/DatabaseHandler.dart';
import '../Screens/dashboard.dart';
import '../Screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  var _nameController = TextEditingController();
  var _passwordController = TextEditingController();
  final LoginService _apiService = LoginService();


  int id = 80301;
  int pass = 123456;

  bool isLoading = false;
  bool _obscureText = true;



  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final user = await _apiService.getUserLogin(_nameController.text, _passwordController.text,);
      if(user.statusCode==200){
        user.body;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
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

    if (_nameController.text.isEmpty || _passwordController.text.isEmpty) {
      _showErrorDialog('कृपया उपयोगकर्ता नाम और पासवर्ड दर्ज करें');
    // } else if (int.parse(_nameController.text) != id) {
    } else if(int.parse(_passwordController.text) != pass && int.parse(_nameController.text) != id) {
      _showErrorDialog('उपयोगकर्ता नाम और पासवर्ड गलत है');
    } else if (int.parse(_nameController.text) != id) {
      _showErrorDialog('उपयोगकर्ता नाम गलत है');
    }  else if (int.parse(_passwordController.text) != pass) {
      _showErrorDialog('पासवर्ड गलत है');
    } else {
      _login();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.h),
                  child: TextFormField(
                    controller: _nameController,
                    onSaved: (value) => _nameController = value as TextEditingController,
                    style: const TextStyle(
                        color: Colors.black54
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "उपयोगकर्ता नाम",
                      contentPadding: EdgeInsets.only(left: 13.w),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.w
                          )
                      ),
                      hintStyle: TextStyle(
                          fontSize: 19.sp,
                          color: Colors.teal
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your user ID';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.0.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.h),
                  color: Colors.white,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    onSaved: (value) => _passwordController = value as TextEditingController,
                    style: const TextStyle(
                        color: Colors.black54
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "पासवर्ड",
                      contentPadding: EdgeInsets.only(left: 13.w),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.w
                          )
                      ),
                      hintStyle: TextStyle(
                          fontSize: 19.sp,
                          color: Colors.teal
                      ),
                      border: OutlineInputBorder(),
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return ;
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 50.w,),
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

                          fillColor: MaterialStateProperty.all(
                              Colors.red.shade700)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Text(
                        "पासवर्ड दिखायें?",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white
                        ),
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
                          borderRadius: BorderRadius.circular(12),
                        )
                    ),
                    onPressed:  _validateAndLogin,
                    child: Text(
                      'लॉग इन',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h,),
                    Text(
                      "Version 1.0",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> _saveUserData(String email, String password) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('email', email);
  //   await prefs.setString('password', password);
  // }
  //
  // Future<Map<String, String>> _getUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final email = prefs.getString('email');
  //   final password = prefs.getString('password');
  //   return {'email': email.toString(), 'password': password.toString()};
  // }


}
