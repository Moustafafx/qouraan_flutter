class ClassModeldateSala {
  final String Fajr;
  final String Dhuhr;
  final String Asr;
  final String Maghrib;
  final String Isha;

  ClassModeldateSala({
    required this.Fajr,
    required this.Dhuhr,
    required this.Asr,
    required this.Maghrib,
    required this.Isha,
  });

  factory ClassModeldateSala.fromJson(Map<String, dynamic> date) {
    return ClassModeldateSala(
      Fajr: date["Fajr"],
      Dhuhr: date["Dhuhr"],
      Asr: date["Asr"],
      Maghrib: date["Maghrib"],
      Isha: date["Isha"],
    );
  }
}
