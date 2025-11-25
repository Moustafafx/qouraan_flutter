import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qouraan_flutter/features/data/models/azkarmodel.dart';

class container_azkar extends StatelessWidget {
  const container_azkar({super.key, required this.soures});

  final List<Modelazkar> soures;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: soures.length,
      itemBuilder: (context, index) {
        final zikr = soures[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 33.h),
            margin: EdgeInsets.only(bottom: 15.h),

            width: 40.w,
            decoration: BoxDecoration(
              border: Border.all(width: 2.w, color: Colors.white),
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.end,
                      maxLines: 10,
                      zikr.content,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55.sp,
                        fontWeight: FontWeight.w800,
                      ),
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
}
