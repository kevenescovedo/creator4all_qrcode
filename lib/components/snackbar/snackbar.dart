import 'package:creator4all_qrocde/shared/themes/appfont.dart';
import 'package:flutter/material.dart';

class SnackBarCustom {
  static showSnackbar({GlobalKey<ScaffoldState> globalKey, String text, Color color}) {
    globalKey.currentState.showSnackBar(SnackBar(
          content: Text(
            text,
            style: AppFont.fontResponseLogin,
          ),
          backgroundColor: color
        ));
  }
}