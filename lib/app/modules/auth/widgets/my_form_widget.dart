import 'dart:ffi';

import 'package:firebasetest/app/core/extensions/build_context_extension.dart';
import 'package:firebasetest/app/modules/auth/domain/helper/auth_validators.dart';
import 'package:firebasetest/app/modules/auth/widgets/my_textform_widget.dart';
import 'package:flutter/material.dart';

class MyFormFields extends StatefulWidget {
  const MyFormFields({super.key, required this.formkey});
  final GlobalKey<FormState> formkey;

  @override
  State<MyFormFields> createState() => _MyFormFieldsState();
}

final _authvalidators = AuthValidators();

class _MyFormFieldsState extends State<MyFormFields> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();

  final FocusNode emailfocusNode = FocusNode();
  final FocusNode passwordfocusNode = FocusNode();
  final FocusNode usernamefocusNode = FocusNode();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    usernamecontroller.dispose();
    emailfocusNode.dispose();
    passwordfocusNode.dispose();
    usernamefocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyTextFormField(
                controller: emailcontroller,
                focusNode: emailfocusNode,
                textInputAction: TextInputAction
                    .next, //to go to the next text field when press enter or done button
                labeltext: context.translate
                    .email, //run when add to the translate file and will go the error
                prefixIcon: Icon(Icons.email),
                obscureText: false,
                onChanged: null,
                validator: (value) {
                  return _authvalidators.emailValidator(value);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              MyTextFormField(
                controller: usernamecontroller,
                focusNode: usernamefocusNode,
                textInputAction: TextInputAction
                    .next, //to go to the next text field when press enter or done button
                labeltext: context.translate
                    .userName, //run when add to the translate file and will go the error
                prefixIcon: Icon(Icons.person),
                obscureText: false,
                onChanged: null,
                validator: (value) {
                  return _authvalidators.usernameValidatore(value);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              MyTextFormField(
                controller: passwordcontroller,
                focusNode: passwordfocusNode,
                textInputAction: TextInputAction
                    .next, //to go to the next text field when press enter or done button
                labeltext: context.translate
                    .password, //run when add to the translate file and will go the error
                prefixIcon: Icon(Icons.password),
                obscureText: false,
                onChanged: null,
                suffixIcon: Icon(Icons.remove_red_eye),
                validator: (value) {
                  return _authvalidators.passwordVlidator(value);
                },
              ),
            ],
          ),
        ));
  }
}
