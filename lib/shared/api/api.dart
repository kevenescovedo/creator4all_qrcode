import 'dart:convert';

import 'package:creator4all_qrocde/shared/models/user.dart';
import 'package:http/http.dart' as http;

class Api {
  static String urlBase = "https://betawebservice.creator4all.com";
  login(User user) async {
    String urlLogin = urlBase + "/conta/pt-br/logar/padrao";
    var response = await http.post(urlLogin, body: user.toMap());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  getTurmas(String token) async {
    String urlGetTurmas = urlBase + "/projeto/pt-br/buscar/grupos/professor";
    var response = await http.get(urlGetTurmas, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print("turmasssssssssssssssssssssssssssssssssssss");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}
