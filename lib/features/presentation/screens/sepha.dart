import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qouraan_flutter/core/cache/shared_preferences_cache.dart';

class Sepha extends StatefulWidget {
  @override
  State<Sepha> createState() => _SephaState();
}

class _SephaState extends State<Sepha> {
  int number = 0;
  int selectedIndex = 0;
  final List<String> sephaImages = [
    "assets/sepah/سبحه_برجاندي-removebg-preview (1).png",

    "assets/sepah/1 (1).png",

    "assets/sepah/سبحه_رصاصي-removebg-preview (1).png",
  ];

  // 🔹 الألوان اللي هتظهر في الزرار (بس شكل)
  final List<Color> colors = [
    Color(0xff6F1C22),
    Color(0xff223C83),
    Colors.grey,

    // برجاندي
  ];

  @override
  void initState() {
    super.initState();
    _loadNumber(); // تحميل العدد المحفوظ
    _loadSelectedImage(); // تحميل الشكل المحفوظ
  }

  // 🔹 تحميل العدد من SharedPreferences
  void _loadNumber() async {
    final savedValue =
        SharedPreferencesCache.Shared_Preferences.getInt('tasbeehNumber') ?? 0;
    setState(() {
      number = savedValue;
    });
  }

  // 🔹 حفظ العدد في SharedPreferences
  void _saveNumber() async {
    await SharedPreferencesCache.setdata(key: 'tasbeehNumber', value: number);
  }

  // 🔹 تحميل الشكل من SharedPreferences
  void _loadSelectedImage() async {
    final savedIndex =
        SharedPreferencesCache.Shared_Preferences.getInt('selectedImage') ?? 0;
    setState(() {
      selectedIndex = savedIndex;
    });
  }

  // 🔹 حفظ الشكل الجديد
  void _saveSelectedImage() async {
    await SharedPreferencesCache.setdata(
      key: 'selectedImage',
      value: selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.h),
        child: AppBar(
          shadowColor: Color(0xffC3C4C6),
          elevation: 1,

          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(colors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // غيّر اللون المختار
                    });
                    _saveSelectedImage();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 116.h,
                    width: 116.w,
                    decoration: BoxDecoration(
                      color: colors[index],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            selectedIndex == index
                                ? Colors.white
                                : Colors.transparent,
                        width: 3.w,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: Text(
            "سبحه",
            style: TextStyle(color: Colors.white, fontFamily: "ReemKufi"),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 170.h),
          Stack(
            children: [
              Center(
                child: Image.asset(
                  sephaImages[selectedIndex],

                  height: 800.h,
                  width: 800.w,
                ),
              ),

              Positioned(
                right: 440.w,
                bottom: 98.h,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      number = number;
                      number++;
                    });
                    _saveNumber();
                  },
                  child: Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99.r),
                      color: Color(0xffABADAC),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 450.h,
                right: 330.w,
                child: Text(
                  "$number",
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 120.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Positioned(
                right: 342.w,
                bottom: 302.h,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      number = 0;
                    });
                    _saveNumber();
                  },
                  child: Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(46.r),
                      color: Color(0xffE2E2E2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
