import 'package:educategirl/Screens/bal_namakan.dart';
import 'package:educategirl/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/gharelu_vibran.dart';

class NamankanSuchi extends StatefulWidget {
  const NamankanSuchi({Key? key}) : super(key: key);

  @override
  State<NamankanSuchi> createState() => _NamankanSuchiState();
}

class _NamankanSuchiState extends State<NamankanSuchi> {

  String selectedValue = 'गाओं का चयन करे';
  String selectedValueTwo = 'नामांकन सूची';

  final List<String> _options = [
    'गाओं का चयन करें',
    'MALASAR',
  ];
  final List<String> _value = [
    'नामांकन सूची',
    'नामांकित',
    'अनामांकित',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          backgroundColor: Colors.red,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo_edugal.png"),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Icon(
                  Icons.home,
                  size: 34,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            )
          ],
          leadingWidth: 50,
          title: Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              "नामांकन सूची",
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
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 155.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40)
                    ),
                    // adjust the width of the container as needed
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(

                          hintText: '  गाओं का चयन करें',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black26
                            )
                          ),
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
                  ),
                  SizedBox(width: 14.w,),
                  Container(
                    width: 155.w,
                    // adjust the width of the container as needed
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          hintText: '  नामांकन सूची',
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
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 38.h,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black26,
                      size: 35,
                    ),
                    hintText: 'बच्चों के नाम से खोजे',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.w, horizontal: 9.h),
                    hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 15.sp,
                        fontFamily: "Lora",
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 6.h,),
              Row(
                children: [
                  SizedBox(width: 17.w,),
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
                            "बच्चों का नाम",
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
                            "आयु",style: TextStyle(
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
                            "लिंग",style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 48.w,)
                ],
              ),
              SizedBox(
                height: 2.w,
              ),
              Row(
                children: [
                  SizedBox(width: 17.w,),
                  Expanded(
                    child: Container(
                      height: 44.h,
                      width: 110.w,
                      decoration: BoxDecoration(
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
                                "Shiva",
                                style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold
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
                            onPressed: () {},
                            child: Text(
                              "9",
                              style: TextStyle(
                                  color: Colors.black,
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
                            onPressed: () {},
                            child: Text(
                              "पुरुष",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 48.w,)
                ],
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/egtp_bg.png"),
                  fit: BoxFit.cover
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 37.h,
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
