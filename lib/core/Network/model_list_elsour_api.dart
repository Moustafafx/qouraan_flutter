import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:qouraan_flutter/features/data/models/model_sour_api.dart';

class model_list_elsour_api {


  Future<List<model_sour_api>> getHttp() async {
    try {
     final String response = await rootBundle.loadString('assets/bn.json');
List<dynamic> data = json.decode(response); // لأن الملف كله List مش Map


      // تحويل القائمة إلى List من الموديل
      List<model_sour_api> sour = data
          .map((item) => model_sour_api.fromjson(item))
          .toList();//السطر دا بياخد البيانت الي جايه من الموقع الي هي اصلا متخزنه في الالمتغير الي  اسمه داتا بيقوله اي خد كل ماب جوا الليست وسميها ايتم وخد منها البيانت الي موجوده في البارسينج الي صفحه الموديل 

      return sour;
    }  catch (e) {
      log(e.toString());
      throw Exception("Oops, there was an error");
    }

  }
}



//assets\bn.json

  
  










/*
class model_list_elsour_api {
  final dio = Dio();
 final String baseurl="https://api.alquran.cloud"

  Future<model_sour_api> getHttp() async {
    try {
  Response response = await dio.get('$baseurl/v1/surah');
 

    model_sour_api  modelsourapi =model_sour_api.fromjson(response.data)
     
     return modelsourapi;

}on DioException catch(e){
final String errormessage=e.response?.data["data"]??"there was error",
throw Exception(errormessage),
} on catch(e){
log(e.tostring());
throw Exception("opps there was error"),
}
}


  
  Map<String, dynamic> jesondata = response.data;
  
  List<dynamic> data = jesondata["data"];
  
  List<model_sour_api> sour=[];
  
  for (var soura in data) {
    model_sour_api modelsourapi = model_sour_api(
      title: soura["name"],
      englishtitle: soura["englishName"],
      number: soura["numberOfAyahs"],
    );
  
   sour.add(modelsourapi);

   
  }
  
   return sour;

} catch (e) {
   print("❌ Error in getHttp(): $e");
    

return [];

  }
}
}

*/










