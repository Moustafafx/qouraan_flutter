import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qouraan_flutter/features/data/models/ctegorymodel.dart';
import 'package:qouraan_flutter/features/presentation/screens/azkar_morning.dart';
import 'package:qouraan_flutter/features/presentation/screens/azkar_night.dart';
import 'package:qouraan_flutter/features/presentation/screens/qebla.dart';
import 'package:qouraan_flutter/features/presentation/screens/sepha.dart';
import 'package:qouraan_flutter/features/presentation/widgets/aya_show_inhome.dart';
import 'package:qouraan_flutter/features/presentation/widgets/categorey_slivergrid.dart';
import 'package:qouraan_flutter/features/presentation/widgets/date_sala.dart';

import 'package:qouraan_flutter/features/presentation/widgets/qouaan_button.dart';

class Home extends StatelessWidget {
  final List<Ctegorymodel> categor = [
    Ctegorymodel(
      image: "assets/sun.png",
      title: "أذكار الصباح",
      page: azkar_morning(),
    ),

    Ctegorymodel(
      image: "assets/cloudy-night.png",
      title: "أذكار المساء",
      page: azkar_night(),
    ),

    Ctegorymodel(
      image: "assets/Kaaba__1_-removebg-preview.png",
      title: "القبله",
      page: qebla(),
    ),

    Ctegorymodel(image: "assets/beads.png", title: "سبحه", page: Sepha()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/جامع.png"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), // اللون اللي هيغمّق الصورة
              BlendMode.srcATop, // طريقة الدمج
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(9.w),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 91.h)),
              SliverToBoxAdapter(child: qouaan_button()),
              SliverToBoxAdapter(child: SizedBox(height: 100.h)),
              SliverToBoxAdapter(child: aya_show_inhome()),
              SliverToBoxAdapter(child: SizedBox(height: 77.h)),
              SliverToBoxAdapter(child: date_sala()),
              SliverToBoxAdapter(child: SizedBox(height: 33.h)),
              categorey_slivergrid(categor: categor),
            ],
          ),
        ),
      ),
    );
  }
}
