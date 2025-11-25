import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qouraan_flutter/features/data/models/class_modeldate_sala.dart';

class ModelDateSalah{


  final Dio dio ;

  ModelDateSalah(this.dio);

 Future<ClassModeldateSala> getHttpByLocation({
  required double lat,
  required double lon,
}) async {
  try {
    Response response = await dio.get(
      'https://api.aladhan.com/v1/timings',
      queryParameters: {
        "latitude": lat,
        "longitude": lon,
        "method": 5,
      },
    );

    Map<String, dynamic> date = response.data["data"]["timings"];
  
  
   ClassModeldateSala salah = ClassModeldateSala.fromJson(date);
   return salah;

} on DioException catch (e) {
  final String errorMessage =e.response?.data["data"]??"there was an error in dio";
throw Exception(errorMessage);

}catch(e){
  log(e.toString());
      throw Exception("Oops, there was an error");
}



 }
 



/*

final String baseUrl="https://api.aladhan.com";

 Future<ClassModeldateSala> getsearch({required String country}) async {
  try {

     Map<String, String> countryCityMap = {
        "Egypt": "Cairo",
        "Saudi Arabia": "Riyadh",
        "United Arab Emirates": "Abu Dhabi",
        "Kuwait": "Kuwait City",
        "Qatar": "Doha",
        "Bahrain": "Manama",
        "Oman": "Muscat",
        "Jordan": "Amman",
        "Lebanon": "Beirut",
        "Morocco": "Rabat",
        "Algeria": "Algiers",
        "Tunisia": "Tunis",
        "Libya": "Tripoli",
        "Iraq": "Baghdad",
        "Sudan": "Khartoum",
        "Yemen": "Sana’a",
        "Syria": "Damascus",
        "USA": "Washington",
        "Canada": "Ottawa",
        "United Kingdom": "London",
        "France": "Paris",
        "Germany": "Berlin",
        "Italy": "Rome",
        "Spain": "Madrid",
        "Australia": "Canberra",
        "India": "New Delhi",
        "China": "Beijing",
        "Japan": "Tokyo",
        "Russia": "Moscow",
        "Brazil": "Brasilia",
        "Argentina": "Buenos Aires",
        "South Africa": "Pretoria",
        "Nigeria": "Abuja",
      };

      String city = countryCityMap[country] ?? "Cairo";
  Response response = await dio.get('$baseUrl/v1/timingsByCity?city=$city&country=$country&method=5');
  
  
  Map<String,dynamic> date = response.data["data"]["timings"];

  bool invalid = date.values.any((v) =>
        v == null ||
        v.toString().trim().isEmpty ||
        v.toString().contains("00:00"));

    if (invalid) {
      throw Exception("لم يتم العثور على مواعيد صحيحة — تحقق من اسم المدينة");
    }
  
   ClassModeldateSala salah = ClassModeldateSala.fromJson(date);
   
return salah;
} on DioException catch (e) {
final String errorMessage =e.response?.data["data"]??"there was an error in dio";
throw Exception(errorMessage);
}catch(e){
log(e.toString());
throw Exception("there was an error");
}


 }

*/





}






//Map<String,dynamic> date = response.data["data"]["timings"]



