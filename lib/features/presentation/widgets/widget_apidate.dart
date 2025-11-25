import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qouraan_flutter/features/data/models/class_modeldate_sala.dart';

class widget_apidate extends StatelessWidget {
  const widget_apidate({super.key, required this.timings});

  final ClassModeldateSala timings;

  String formatTime(String time) {
    try {
      final parsedTime = DateFormat("HH:mm").parse(time);
      // التنسيق بالعربية لكن بالأرقام الإنجليزية
      return DateFormat(
        "h:mm",
        "en",
      ).format(parsedTime).replaceAll("AM", "ص").replaceAll("PM", "م");
    } catch (e) {
      print("Error parsing time: $time -> $e");
      return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "العشاء",
              style: TextStyle(
                fontSize: 54.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              formatTime(timings.Isha),
              //     " ${timings.Isha}",
              style: TextStyle(
                fontSize: 46.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "المغرب",
              style: TextStyle(
                fontSize: 54.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              formatTime(timings.Maghrib),
              //   " ${timings.Maghrib}",
              style: TextStyle(
                fontSize: 46.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "العصر",
              style: TextStyle(
                fontSize: 54.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              formatTime(timings.Asr),
              //   " ${timings.Asr}",
              style: TextStyle(
                fontSize: 46.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "الظهر",
              style: TextStyle(
                fontSize: 54.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              formatTime(timings.Dhuhr),
              //  " ${timings.Dhuhr}",
              style: TextStyle(
                fontSize: 46.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "الفجر",
              style: TextStyle(
                fontSize: 54.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              formatTime(timings.Fajr),
              //    " ${timings.Fajr}",
              style: TextStyle(
                fontSize: 46.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


















/*

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qouraan_flutter/features/data/models/class_modeldate_sala.dart';

class widget_apidate extends StatelessWidget {
  const widget_apidate({super.key, required this.timings});

  final ClassModeldateSala timings;

  String formatTime(String time) {
    try {
      final parsedTime = DateFormat("HH:mm").parse(time);
      // التنسيق بالعربية لكن بالأرقام الإنجليزية
      return DateFormat(
        "h:mm",
        "en",
      ).format(parsedTime).replaceAll("AM", "ص").replaceAll("PM", "م");
    } catch (e) {
      print("Error parsing time: $time -> $e");
      return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "الفجر",
              style: TextStyle(
                fontSize: 69.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              formatTime(timings.Fajr),
              //    " ${timings.Fajr}",
              style: TextStyle(
                fontSize: 55.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "الظهر",
              style: TextStyle(
                fontSize: 69.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              formatTime(timings.Dhuhr),
              //  " ${timings.Dhuhr}",
              style: TextStyle(
                fontSize: 55.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "العصر",
              style: TextStyle(
                fontSize: 69.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              formatTime(timings.Asr),
              //   " ${timings.Asr}",
              style: TextStyle(
                fontSize: 55.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "الغرب",
              style: TextStyle(
                fontSize: 69.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              formatTime(timings.Maghrib),
              //   " ${timings.Maghrib}",
              style: TextStyle(
                fontSize: 55.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "العشاء",
              style: TextStyle(
                fontSize: 69.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              formatTime(timings.Isha),
              //     " ${timings.Isha}",
              style: TextStyle(
                fontSize: 55.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

*/