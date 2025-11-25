import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:qouraan_flutter/features/data/models/azkarmodel.dart';

class Askarmodeljeson {




  Future<List<Modelazkar>> loadAzkar() async {
    final String response = await rootBundle.loadString('assets/ar.json');
    final List data = json.decode(response);
    return data.map((e) => Modelazkar.fromJson(e)).toList();
  }

  }
