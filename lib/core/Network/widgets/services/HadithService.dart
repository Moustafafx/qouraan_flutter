import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:qouraan_flutter/features/data/models/HadithModel.dart';

class HadithService {
  Future<List<HadithModel>> getAhadith() async {
    try {
      final String response = await rootBundle.loadString('assets/qudsi40.json');
      final Map<String, dynamic> jsonData = json.decode(response);

      // هنا بنختار الكتاب أو المفتاح اللي فيه الأحاديث
      final List data = jsonData['hadiths']; // لو فيه أكثر من كتاب ممكن تختار [0] أو اسم الكتاب
      
      return data.map((e) => HadithModel.fromJson(e)).toList();
    } catch (e) {
      print("Error loading hadiths: $e");
      throw Exception("Failed to load hadiths: $e");
    }
  }
}
