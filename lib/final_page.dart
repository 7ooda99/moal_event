import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 80.h,
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 100.r,
                          width: 100.r,
                          child: Image.asset('assets/Success.png')),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'شكرا لك تم اكمال التسجيل بنجاح',
                        style: TextStyle(
                          color: Colors.white
                              .withOpacity(0.9), // slightly transparent white
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "..بين دروب التقنية حاولنا إبهاجكم، نرجو أن نكون قد حزنا على رضاكم وأدخلنا البهجة على قلوبكم",
                        style: TextStyle(
                          color: Colors.white
                              .withOpacity(0.9), // slightly transparent white
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        '- فريق نادي قوقل للطلبة المطورين بجامعة الباحة.',
                        style: TextStyle(
                          color: Colors.white
                              .withOpacity(0.9), // slightly transparent white
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
