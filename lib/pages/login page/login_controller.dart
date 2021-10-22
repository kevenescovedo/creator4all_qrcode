import 'package:creator4all_qrocde/components/snackbar/snackbar.dart';
import 'package:creator4all_qrocde/shared/api/api.dart';
import 'package:creator4all_qrocde/shared/models/user.dart';
import 'package:creator4all_qrocde/shared/themes/appfont.dart';
import 'package:flutter/material.dart';

class LoginController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);
  ValueNotifier<bool> obscureNotifier = ValueNotifier<bool>(false);
  final formKey = GlobalKey<FormState>();
  final keyScaffold = GlobalKey<ScaffoldState>();
  User user = User();
  Api api = Api();

  String validateName(String value) {
    if (value.isEmpty) {
      return "O usuário não pode estar vazio";
    } else {
      return null;
    }
  }

  void onChange({String name, String password}) {
    user = user.copyWith(usuario: name, senha: password);
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "A senha não pode estar vázio";
    } else {
      return null;
    }
  }

  void login(BuildContext context) async {
    if (formKey.currentState.validate()) {
      loadingNotifier.value = true;
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
      print(user.usuario);
      print(user.senha);
      var map = await api.login(user);
      loadingNotifier.value = false;
      if (map["status"] == "erro") {
        SnackBarCustom.showSnackbar(
            color: Colors.red, text: map['mensagem'], globalKey: keyScaffold);
      } else {
        User userloged = User.fromMap(map['usuario']);
        Navigator.pushReplacementNamed(context, "/home", arguments: userloged);
      }
    }
  }
}
