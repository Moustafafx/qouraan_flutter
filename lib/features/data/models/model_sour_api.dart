class model_sour_api{
  final String title;
  final String englishtitle;
  final int number;

  model_sour_api({required this.title, required this.englishtitle, required this.number,});




factory  model_sour_api.fromjson(json){
return  model_sour_api(
  title:json[ "name"] ,

 englishtitle:json["transliteration"]  ,
  number:json["total_verses"] ,

   );
}


}