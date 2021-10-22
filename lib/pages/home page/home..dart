import 'package:animated_card/animated_card.dart';
import 'package:creator4all_qrocde/pages/home%20page/home_xontroller.dart';
import 'package:creator4all_qrocde/shared/api/api.dart';
import 'package:creator4all_qrocde/shared/models/class.dart';
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
  @override
  Widget build(BuildContext context) {
    ;
    print(widget.user.token);
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
                  IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/");
                      })
                ]),
                subtitle: Text(
                  "Controle as notas dos seus alunos !",
                  style: AppFont.fontTextSeconddAppBar,
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(152)),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        height: double.infinity,
        child: FutureBuilder<List<Turma>>(
          future: HomeController.initGetTurmas(widget.user.token),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: Lottie.asset('assets/animations/loading.json',
                      height: 300));
            } else {
              List<Turma> turmas = snapshot.data;
              return ListView.builder(
                itemCount: turmas.length,
                itemBuilder: (BuildContext context, int index) {
                  Turma turma = turmas[index];
                  print(
                      "dados turmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                  print(turma.nome);
                  print(turma.anoLetivo);
                  print(turma.rede['nome']);
                  return AnimatedCard(
                    direction: AnimatedCardDirection.right,
                    child: ListTile(
                      title: Text(
                        "${turma.nome} - ${turma.anoLetivo} ",
                        style: AppFont.fontTextTurma,
                      ),
                      subtitle: turma.rede.isNotEmpty
                          ? Text(
                              "${turma.rede['nome']}",
                              style: AppFont.fontRede,
                            )
                          : Text("sem rede"),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
