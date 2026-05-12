import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qouraan_flutter/features/logic/cubit/search_reader_cubit/search_reader_cubit.dart';
import 'package:qouraan_flutter/features/logic/cubit/search_reader_cubit/search_reader_states_cubit.dart';
import 'package:qouraan_flutter/features/presentation/widgets/widget_apidate.dart';

class date_sala extends StatelessWidget {
  const date_sala({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchReaderCubit()..loadCachedData(),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: BlocBuilder<SearchReaderCubit, Datacity>(
          builder: (context, state) {
            if (state is initialState) {
              return Center(child: CircularProgressIndicator());
            }
            ;

            if (state is dataloding) {
              return widget_apidate(timings: state.classModeldateSala);
            }

            if (state is falierdata) {
              return Center(
                child: Text(
                  "oops no have data",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }
            return Center(child: Text("Something went wrong"));
          },
        ),
      ),
    );
  }
}

















/*

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'model_date_salah.dart';
import 'class_modeldate_sala.dart';

class PrayerScreen extends StatelessWidget {
  final api = ModelDateSalah(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("مواقيت الصلاة")),
      body: FutureBuilder<ClassModeldateSala>(
        future: api.getHttp(), // هنا نستنى الدالة async
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
          final timings = snapshot.data!;

          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text("الفجر: ${timings.Fajr}"),
              Text("الظهر: ${timings.Dhuhr}"),
              Text("العصر: ${timings.Asr}"),
              Text("المغرب: ${timings.Maghrib}"),
              Text("العشاء: ${timings.Isha}"),
            ],
          );
        },
      ),
    );
  }
}


*/

/*

         Text(
                "الفجر: ${timings.Fajr}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                "الظهر: ${timings.Dhuhr}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                "العصر: ${timings.Asr}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                "المغرب: ${timings.Maghrib}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "العشاء: ${timings.Isha}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
*/