class Modelazkar {
  final String content;
  final int type;
  var length;

  Modelazkar({required this.content, required this.type});

  factory Modelazkar.fromJson(Map<String, dynamic> json) {
    return Modelazkar(type: json['type'], content: json["content"] ?? "");
  }
}
