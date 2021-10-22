import 'package:creator4all_qrocde/shared/api/api.dart';
import 'package:creator4all_qrocde/shared/models/class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeController {
  static Future<List<Turma>> initGetTurmas(String token) async {
    List<Turma> turmasObjectList = [];
    Api api = Api();
    var map = await api.getTurmas(token);
    print("aaaaaaaaaaaaaaaaa");
    List<dynamic> turmas = map["resultado"];
    for (Map<String, dynamic> turma in turmas) {
      turmasObjectList.add(Turma.fromMap(turma));
    }
    return turmasObjectList;
  }
}
