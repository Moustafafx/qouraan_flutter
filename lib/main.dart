import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qouraan_flutter/core/cache/shared_preferences_cache.dart';
import 'package:qouraan_flutter/features/presentation/screens/home.dart';
import 'package:qouraan_flutter/features/presentation/screens/splash_screen.dart';
import 'package:quran_library/quran.dart';


void main() async {




  WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesCache.cacheInitialization();
  await initializeDateFormatting('en');
 await QuranLibrary.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
  designSize: const Size(1080, 2400),
  minTextAdapt: true,
  builder: (context, child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: child,
    );
  },
  child: Home(), // <-- هنا تحط الصفحة الرئيسية
);
  }
}
