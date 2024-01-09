import 'package:firebasetest/app/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.textInputAction,
      required this.labeltext,
      required this.prefixIcon,
      this.suffixIcon,
      this.togglePassword,
      required this.obscureText,
      required this.onChanged,
      this.validator});

  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final String labeltext;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final Function()? togglePassword; //onPressed type
  final bool obscureText;
  final Function(String?)? onChanged; //onChange type
  final String? Function(String?)? validator; //validator type
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.07,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode, //to hide and unhide the keybord
        textInputAction:
            textInputAction, //type of the keybord (numbers , letters)
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          label: Text(labeltext),
          prefix: prefixIcon,
          suffix: IconButton(
            onPressed: togglePassword,
            icon: suffixIcon ?? SizedBox(),
          ), //if there is no icon then return a sizedbox
        ),
        obscureText: obscureText, //to hide the text in the textformfield);
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
