import 'package:firebasetest/app/core/extensions/build_context_extension.dart';
import 'package:firebasetest/app/modules/auth/widgets/my_form_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.register),
      ),
      body: Column(children: [MyFormFields(formkey: formkey)]),
    );
  }
}
