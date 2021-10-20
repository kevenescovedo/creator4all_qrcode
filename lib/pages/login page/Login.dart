import 'package:creator4all_qrocde/components/header_widget/header_widget.dart';
import 'package:creator4all_qrocde/components/textform_widget/textform_widget.dart';
import 'package:creator4all_qrocde/pages/login%20page/login_controller.dart';
import 'package:creator4all_qrocde/shared/themes/appcolors.dart';
import 'package:creator4all_qrocde/shared/themes/appfont.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller;
  @override
  void initState() {
    controller = LoginController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.keyScaffold,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(children: [
                HeaderWidget(),
                SizedBox(
                  height: 20,
                ),
                /*  Divider(
              thickness: 2,
            ), */
                Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormWidget(
                          onchange: (String value) {
                            controller.onChange(name: value);
                          },
                          validate: controller.validateName,
                          controller: controller.userController,
                          icon: Icons.person_outlined,
                          label: 'Usúario: ',
                          placeHolder: 'Usuário',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormWidget(
                          loginController: controller,
                          onchange: (String value) {
                            controller.onChange(password: value);
                          },
                          validate: controller.validatePassword,
                          controller: controller.passwrodController,
                          icon: Icons.lock_outline,
                          inputType: TextInputType.text,
                          label: 'Senha: ',
                          placeHolder: 'Senha',
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    )),
                Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        controller.login(context);
                      },
                      child: ValueListenableBuilder(
                        valueListenable: controller.loadingNotifier,
                        builder: (context, value, child) {
                          if (!value) {
                            return Text(
                              "Entrar",
                              style: AppFont.fontButtonLogin,
                            );
                          } else {
                            return CircularProgressIndicator(
                              backgroundColor: Colors.red,
                            );
                          }
                        },
                      ),
                      color: AooColors.colorButtonLogin,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Esqueçeu a senha",
                  style: AppFont.fontForgetPassword,
                )
              ]),
            ),
          ),
        ));
  }
}
