import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'app_input_field.dart';

class FieldInput extends StatelessWidget {
  final String fieldLabel;
  final TextEditingController txtController;
  final String placeholder;
  final bool isObscure;
  final Icon? icon;
  final int lines;
  final TextInputType type;
  final Color bgColor;

  FieldInput(
      {Key? key,
      required this.fieldLabel,
      required this.txtController,
      required this.placeholder,
      this.isObscure = false,
      this.icon,
      this.lines = 1,
      this.type = TextInputType.name,
      this.bgColor = AppColors.lightgray})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            fieldLabel,
            style: AppTxtStyle.bBold(15),
          ),
          AppStyle.yGapXs,
          AppInputField(
              controller: txtController,
              hintText: placeholder,
              obscureText: isObscure,
              icon: icon,
              bgColor: bgColor,
              lines: lines,
              type: type),
          AppStyle.yGapSm
        ]);
  }
}
