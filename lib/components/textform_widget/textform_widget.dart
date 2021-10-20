import 'package:creator4all_qrocde/pages/login%20page/login_controller.dart';
import 'package:creator4all_qrocde/shared/themes/appfont.dart';
import 'package:flutter/material.dart';
import '../../shared/themes/appcolors.dart';

class TextFormWidget extends StatelessWidget {
  String placeHolder;
  String label;
  IconData icon;
  TextInputType inputType;
  TextEditingController controller;
  Function(String value) validate;
  Function(String value) onchange;
  LoginController loginController;
  TextFormWidget(
      {this.placeHolder,
      this.icon,
      this.label,
      this.inputType,
     
      this.controller,
      this.validate,
      this.onchange,
      this.loginController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFont.fontLabelInput,
        ),
        placeHolder == "Senha"
            ? ValueListenableBuilder(
                valueListenable: loginController.obscureNotifier,
                builder: (context, value, child) {
                  return TextFormField(
                    
                    onChanged: onchange,
                    controller: controller,
                    validator: validate,
                    style: AppFont.fontInput,
                    obscureText: !value,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            loginController.obscureNotifier.value =
                                !loginController.obscureNotifier.value;
                          },
                          child: Icon(
                            value ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        errorStyle: AppFont.erroStyleInput,
                        prefixIcon: Icon(
                          icon,
                          color: AooColors.colorIcon,
                        ),
                        hintText: placeHolder,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AooColors.borderInput, width: 0.0),
                        )),
                    keyboardType: inputType,
                  );
                })
            : TextFormField(
                onChanged: onchange,
                controller: controller,
                validator: validate,
                style: AppFont.fontInput,
            
                decoration: InputDecoration(
                    errorStyle: AppFont.erroStyleInput,
                    prefixIcon: Icon(
                      icon,
                      color: AooColors.colorIcon,
                    ),
                    hintText: placeHolder,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AooColors.borderInput, width: 0.0),
                    )),
                keyboardType: inputType,
              ),
      ],
    );
  }
}
