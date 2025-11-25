import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qouraan_flutter/features/logic/cubit/Hadith_cubit/Hadith_cubit.dart';
import 'package:qouraan_flutter/features/logic/cubit/Hadith_cubit/Hadith_cubit_states.dart';

class aya_show_inhome extends StatelessWidget {
  const aya_show_inhome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadithCubit()..fetchTodayHadith(), // 👈 مهم
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: Colors.white),
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: BlocBuilder<HadithCubit, HadithState>(
          builder: (context, state) {
            if (state is HadithLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            if (state is HadithSuccess) {
              return Text(
                state.hadith.hadith,
                maxLines: 20,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w700,
                ),
              );
            }

            return Text(
              "حدث خطأ في تحميل الحديث",
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
