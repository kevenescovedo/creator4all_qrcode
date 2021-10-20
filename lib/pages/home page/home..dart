import 'package:creator4all_qrocde/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:creator4all_qrocde/shared/themes/appcolors.dart';
import 'package:creator4all_qrocde/shared/themes/appfont.dart';
import 'package:lottie/lottie.dart';

class HomePge extends StatefulWidget {
  User user;
  HomePge({this.user});

  @override
  _HomePgeState createState() => _HomePgeState();
}

class _HomePgeState extends State<HomePge> {
  @override
  Widget build(BuildContext context) {
    print(widget.user.toString());

    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              color: AooColors.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Center(
              child: ListTile(
                title: Text.rich(
                    TextSpan(text: 'Olá, ', style: AppFont.fontOla, children: [
                  TextSpan(text: widget.user.nome, style: AppFont.fontName),
                ])),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    child: Lottie.asset('assets/animations/animation_home.json',
                        height: 100),
                  )
                ]),
                subtitle: Text(
                  "Controle as notas do seu aluno !",
                  style: AppFont.fontTextSeconddAppBar,
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(152)),
    );
  }
}
