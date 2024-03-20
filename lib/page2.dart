import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moal_event/final_page.dart';

class Question2 extends StatefulWidget {
  Question2({super.key});
  int selectedNumber = 1;
  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  @override
  Widget build(BuildContext context) {
    Key wrapKey = UniqueKey();
    bool isWideScreen = MediaQuery.of(context).size.width > 500;

    Widget numberButton(int number) {
      return ElevatedButton(
        onPressed: () => setState(() {
          widget.selectedNumber = number;
          wrapKey = wrapKey;
          print(widget.selectedNumber);
        }),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.selectedNumber == number
              ? Colors.blue
              : Colors.transparent, // Color changes when selected
          side: const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Border radius
          ),
        ),
        child: Text(
          number.toString(),
          style: const TextStyle(
            color: Colors.white, // Text color
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
      );
    }

    // @override
    // void initState() {
    //   super.initState();
    //   numberButton(2);
    // }

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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  Image.asset(
                    'assets/3.png',
                    fit: BoxFit.fill,
                    width: 250.w,
                    height: 150.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Center(
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 120.r),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2 -> كم عدد الحضور ؟',
                            style: TextStyle(
                              color: Colors.white.withOpacity(
                                  0.9), // slightly transparent white
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(5),
                                child: Wrap(
                                  // key: wrapKey,
                                  runSpacing: 15.r,
                                  spacing: 15.r, // Gap between buttons
                                  children: List<Widget>.generate(
                                    6, // Generate 6 buttons
                                    (index) => numberButton(index + 1),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              ElevatedButton(
                                onPressed: () => setState(() {
                                  widget.selectedNumber = 7;

                                  print(widget.selectedNumber);
                                }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: widget.selectedNumber == 7
                                      ? Colors.blue
                                      : Colors
                                          .transparent, // Color changes when selected
                                  side: const BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Border radius
                                  ),
                                ),
                                child: const Text(
                                  '7+',
                                  style: TextStyle(
                                    color: Colors.white, // Text color
                                    fontWeight: FontWeight.bold, // Font weight
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          ElevatedButton.icon(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .add({
                                'number_of_attendees': widget
                                    .selectedNumber, // Store the selected number
                                'timestamp': FieldValue
                                    .serverTimestamp(), // Add a server-side timestamp
                              });

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FinalPage()),
                              );
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
}
