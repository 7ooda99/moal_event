import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moal_event/final_page.dart';
import 'package:moal_event/page1.dart';
import 'package:moal_event/page2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDC0s-_utvkW0YnUFdl0Nm-v1jI2E4MIpI",
          authDomain: "gdscbu-moal-event.firebaseapp.com",
          projectId: "gdscbu-moal-event",
          storageBucket: "gdscbu-moal-event.appspot.com",
          messagingSenderId: "278732684905",
          appId: "1:278732684905:web:bb4430c18bea64722d6cf8",
          measurementId: "G-MFER0GQPMH"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(1000, 600), // The design size based on your UI design
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if we are on a wide screen or not
    bool isWideScreen = MediaQuery.of(context).size.width > 500;

    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight,
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(
          //       'assets/star.jpg'), // Replace with your background image asset
          //   fit: BoxFit.cover, // Cover the entire widget area
          // ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF022e57),
              Color(0xFF6ea5d8),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
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
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // Use a Flex direction based on screen width for responsiveness
              Flex(
                direction: isWideScreen ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DateInfoBox(label: '17.9', value: '1445'),
                  if (isWideScreen)
                    VerticalDivider(
                        color: Colors.white, width: 50.w, thickness: 2),
                  const CountdownTimerBox(),
                  if (isWideScreen)
                    VerticalDivider(
                        color: Colors.white, width: 50.w, thickness: 2),
                  const DateInfoBox(label: '10 : 00', value: 'الاربعاء'),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                'وثق حضورك معنا',
                style: TextStyle(
                  color: Colors.white
                      .withOpacity(0.9), // slightly transparent white
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'برمضانية نادي قوقل للطلبة المطورين بجامعة الباحة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white
                      .withOpacity(0.85), // slightly transparent white
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.grey,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.r, vertical: 16.r),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Question1()),
                  );
                },
                child: Text(
                  'شاركنا',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class DateInfoBox extends StatelessWidget {
  final String label;
  final String value;

  const DateInfoBox({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 500;
    return Container(
      margin: isWideScreen
          ? EdgeInsets.symmetric(horizontal: 20.r)
          : EdgeInsets.only(bottom: 20.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            // height: 10.0,
            child: Center(
              child: Container(
                // margin: const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                width: 80.w,
                height: 2.0.h,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CountdownTimerBox extends StatelessWidget {
  const CountdownTimerBox({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 500;
    return Container(
      width: 300.w,
      height: 200.h,
      margin: isWideScreen
          ? EdgeInsets.symmetric(horizontal: 20.r)
          : EdgeInsets.only(bottom: 40.r),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            // offset: off
            spreadRadius: 5,
            offset: Offset.infinite,
            blurRadius: 5,
          )
        ],
        color: Colors.black.withOpacity(0.4), // semi-transparent black
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white),
      ),
      child: const Center(
        // TODO: Insert your CountdownTimerPage here
        child: CountdownTimerPage(),
      ),
    );
  }
}

class CountdownTimerPage extends StatefulWidget {
  const CountdownTimerPage({super.key});

  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  Duration _duration = const Duration();
  Timer? _timer;
  final _targetDateTime = DateTime(2024, 3, 27, 10); // Target date and time

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  void _initializeTimer() {
    final now = DateTime.now();
    final targetTime = _targetDateTime
        .subtract(const Duration(days: 0)); // 8 days before the event
    _duration = targetTime.difference(now);
    if (_duration.isNegative) {
      // The date is in the past, so no countdown is needed.
      return;
    }
    // Continue to countdown
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _tick() {
    setState(() {
      final seconds = _duration.inSeconds - 1;
      if (seconds < 0) {
        _timer?.cancel();
        // Handle completion of the countdown
      } else {
        _duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final days = twoDigits(_duration.inDays);
    final hours = twoDigits(_duration.inHours.remainder(24));
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));

    return
        // backgroundColor: Colors.black,
        Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textDirection: TextDirection.ltr,
            '$days Days',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            textDirection: TextDirection.rtl,
            '$hours:$minutes:$seconds',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
