import 'package:creator4all_qrocde/shared/themes/appfont.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/images/logo_creator4all.png"),
      title: Text(
        "Creator4all",
        style: AppFont.fontnameLogo,
      ),
      subtitle: Text(
        "Imagine, crie, compartilhe...",
        style: AppFont.fontsubtitleHeadef,
      ),
    );
  }
}
