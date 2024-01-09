import 'dart:ffi';

import 'package:firebasetest/app/core/extensions/build_context_extension.dart';
import 'package:firebasetest/app/modules/auth/domain/helper/auth_validators.dart';
import 'package:firebasetest/app/modules/auth/domain/providers/state/auth_provider.dart';
import 'package:firebasetest/app/modules/auth/widgets/my_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFormFields extends ConsumerStatefulWidget {
  const MyFormFields({super.key, required this.formkey});
  final GlobalKey<FormState> formkey;

  @override
  ConsumerState<MyFormFields> createState() => _MyFormFieldsState();
}

final _authvalidators = AuthValidators();

class _MyFormFieldsState extends ConsumerState<MyFormFields> {
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
    final formProvider = ref.watch(authFormController);
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
                prefixIcon: const Icon(Icons.email),
                obscureText: false,
                onChanged: (value) {
                  if (value != null) {
                    formProvider.setEmailField(value);
                  }
                  return null;
                }, //email textFormfield value
                validator: (value) {
                  return _authvalidators.emailValidator(value);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.03,
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
                onChanged: (value) {
                  if (value != null) {
                    formProvider.setUserNameField(value);
                  }
                  return null;
                },
                validator: (value) {
                  return _authvalidators.usernameValidatore(value);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.03,
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
                onChanged: (value) {
                  if (value != null) {
                    formProvider.setPasswordField(value);
                  }
                  return null;
                },

                validator: (value) {
                  return _authvalidators.passwordVlidator(value);
                },

                togglePassword: () {
                  formProvider.togglePasswordIcon();
                },
                suffixIcon: Icon(
                  formProvider.togglePassword
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded,
                ),
              ),
            ],
          ),
        ));
  }
}
