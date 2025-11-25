import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qouraan_flutter/core/Network/widgets/services/askarmodeljeson.dart';
import 'package:qouraan_flutter/features/presentation/widgets/container_akkar.dart';

class azkar_morning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: Text(
          "اذكار الصباح",
          style: TextStyle(color: Colors.white, fontFamily: "ReemKufi"),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
        future: Askarmodeljeson().loadAzkar(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("حدث خطأ: ${snapshot.error}"));
          }

          if (!snapshot.hasData) {
            return Center(child: Text("لا توجد بيانات"));
          }

          // هنا الكائن موجود وجاهز للاستخدام
          final soures = snapshot.data!;
          final morningAzkar = soures.where((z) => z.type == 1).toList();

          return Padding(
            padding: EdgeInsets.all(8.w),
            child: container_azkar(soures: morningAzkar),
          );
        },
      ),
    );
  }
}
