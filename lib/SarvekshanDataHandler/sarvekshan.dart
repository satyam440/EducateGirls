import 'package:educategirl/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/gharelu_vibran.dart';
import '../Screens/namankan_suchi.dart';
import 'data_model.dart';

class Sarvekshan extends StatefulWidget {
  DataModel? data;
  Sarvekshan({super.key, this.data});

  @override
  State<Sarvekshan> createState() => _SarvekshanState();
}

class _SarvekshanState extends State<Sarvekshan> {


  List<DataModel> dataList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   dataList.add(widget.data);
  // }


  String selectedValue = 'MALABAR';
  final List<String> _options = [
    'गाओं का चयन',
    'MALABAR',
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
                child: const Icon(
                  Icons.home,
                  size: 34,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                },
              ),
            )
          ],
          leadingWidth: 50,
          title: Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              "D2D सर्वेक्षण",
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
                SizedBox(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black26,
                          )),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedValue,
                        items: _options
                            .map((option) => DropdownMenuItem<String>(
                          value: option,
                          child: TextButton(
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            },
                            child: Text(
                              option,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        isExpanded: true,
                        elevation: 0,
                        dropdownColor: Colors.white,
                        underline: Container(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 40.h,
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
                      hintText: 'HH नंबर से खोजे',
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
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                      onPressed: () {
                        //Logic for Moving into another screen
                        if(selectedValue == "MALABAR") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewHome()));
                        }

                      },
                      child: Text(
                        "नया घर जोडें",
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      )),
                ),
                SizedBox(height: 18.h,),
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
                              "HH नंबर",style: TextStyle(
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
                              "पिता का नाम",style: TextStyle(
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
                              "बच्चे",style: TextStyle(
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewHome()));
                              },
                              child: Text(
                                "A123",
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
                                "Ravi",
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
                                "1",
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
                // ListView.builder(
                //   itemCount: dataList.length,
                //   itemBuilder: (context, index) {
                //     final data = dataList[index];
                //     return Row(
                //       children: [
                //         SizedBox(width: 17.w,),
                //         Flexible(
                //           child: Container(
                //             height: 44.h,
                //             width: 110.w,
                //             color: Colors.red.shade700,
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   data.homeNumber,
                //                   style: TextStyle(
                //                     fontSize: 15.sp,
                //                     fontWeight: FontWeight.bold
                //                 ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //         SizedBox(width: 1.w,),
                //         Flexible(
                //           child: Container(
                //             height: 44.h,
                //             width: 110.w,
                //             color: Colors.red.shade700,
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   data.fatherName,style: TextStyle(
                //                     fontSize: 15.sp,
                //                     fontWeight: FontWeight.bold
                //                 ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //         SizedBox(width: 1.w,),
                //         Flexible(
                //           child: Container(
                //             height: 44.h,
                //             width: 110.w,
                //             color: Colors.red.shade700,
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   data.hhNumber,style: TextStyle(
                //                     fontSize: 15.sp,
                //                     fontWeight: FontWeight.bold
                //                 ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //         SizedBox(width: 48.w,)
                //       ],
                //     );
                //   },
                // )
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
                        Navigator.pop(context);
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
