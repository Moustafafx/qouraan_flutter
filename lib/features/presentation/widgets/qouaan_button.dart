import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_library/quran_library.dart';

class qouaan_button extends StatelessWidget {
  const qouaan_button({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // عند الضغط على الزر نفتح شاشة القرآن الجاهزة
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => QuranLibraryScreen(
                    parentContext: context, // لازم تمرر سياق الأب
                  ),
            ),
          );
        },
        child: Container(
          height: 560.h,
          width: 1040.w,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(44.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "القرآن الكريم",
                style: TextStyle(
                  fontSize: 90.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ReemKufi",
                ),
              ),
              Image.asset(
                "assets/مصحف-removebg-preview.png",
                width: 490.w, // خلي الصورة متجاوبة مع العرض
                height: 490.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
