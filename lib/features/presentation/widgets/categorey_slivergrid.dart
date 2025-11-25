import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qouraan_flutter/features/data/models/ctegorymodel.dart';

class categorey_slivergrid extends StatelessWidget {
  const categorey_slivergrid({super.key, required this.categor});

  final List<Ctegorymodel> categor;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        final category = categor[index];
        return Align(
          child: GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => category.page));
            },
            child: Container(
              height: 600.h,
              width: 600.w,
              child: Column(
                children: [
                  Image.asset(
                    category.image,
                    height: 290.h,
                    width: 290.w,
                    fit: BoxFit.cover,
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    category.title,
                    style: TextStyle(
                      fontSize: 54.sp,
                      color: Colors.white,
                      fontFamily: "ReemKufi",
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }, childCount: categor.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
