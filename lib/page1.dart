import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moal_event/final_page.dart';
import 'package:moal_event/page2.dart';

class Question1 extends StatefulWidget {
  const Question1({super.key});

  @override
  State<Question1> createState() => _Question1State();
}

TextEditingController controller = TextEditingController();

class _Question1State extends State<Question1> {
  final _formKey = GlobalKey<FormState>(); // Unique key for the form

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 500;

    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF022e57),
              Color(0xFF6ea5d8),
            ],
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/4.png',
                    fit: BoxFit.fitWidth,

                    width: isWideScreen
                        ? 250.w
                        : 250.w, // Adjusts size based on screen width
                    height: isWideScreen ? 150.h : 150.h,
                  ),
                  // Only display the second image on wide screens
                  // Image.asset(
                  //   'assets/3.png',
                  //   fit: BoxFit.fill,
                  //   width: 250.w,
                  //   height: 150.h,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Center(
              child: SingleChildScrollView(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 300.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1 -> الإسم الكامل :',
                            style: TextStyle(
                              color: Colors.white.withOpacity(
                                  0.9), // slightly transparent white
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            controller: controller,
                            style: const TextStyle(
                              color: Colors.white, // Text color
                            ),
                            decoration: InputDecoration(
                              labelText: "الاسم",
                              labelStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white), // Border color
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red), // Error border color
                              ),
                              focusedErrorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .red), // Error border color when the field is focused
                              ),
                              errorStyle: const TextStyle(
                                  color: Colors.red), // Error text color
                            ),
                            keyboardType: TextInputType
                                .name, // Keyboard type for name input
                            textInputAction: TextInputAction
                                .next, // Sets the keyboard action button label for usability
                            validator: (value) {
                              // Basic validation
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال الاسم'; // Error message when the field is empty
                              }
                              if (value.length < 3) {
                                return 'يجب ألا يقل الاسم عن 3 أحرف'; // Error message when the name is too short
                              }
                              return null; // Return null if the input is valid
                            },
                          ),
                          SizedBox(height: 30.h),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar or proceed with your logic.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Question2(
                                            name: controller.text,
                                          )),
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.check, // Button icon
                              color: Colors.green, // Icon color
                            ),
                            label: const Text(
                              'تم', // Button text
                              style: TextStyle(color: Colors.green),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12.r), // Button border radius
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void sendData() async {
  //   String textToSend = controller.text;
  //   if (textToSend.isNotEmpty) {
  //     await FirebaseFirestore.instance.collection('users').add({
  //       'users': textToSend,
  //       'timestamp': FieldValue
  //           .serverTimestamp(), // Optional: Adds server-side timestamp
  //     });
  //     controller.clear(); // Optional: Clears the text field after sending
  //   }
  // }
}
