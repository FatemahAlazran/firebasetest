import 'package:firebasetest/app/config/theme/my_colors.dart';
import 'package:firebasetest/app/core/extensions/build_context_extension.dart';
import 'package:firebasetest/app/modules/auth/widgets/my_form_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.blue,
        title: Text(
          context.translate.register,
          style: context.textTheme.headlineLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyFormFields(formkey: formkey),
            SizedBox(
              height: context.screenHeight * 0.04,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  context.translate.register,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  context.translate.googlesignin,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ))
          ]),
        ),
      ),
    );
  }
}
