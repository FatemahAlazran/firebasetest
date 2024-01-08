import 'package:firebasetest/app/config/router/my_named_route.dart';
import 'package:firebasetest/app/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          context.push(MyNamedRoutes.register);
        },
        child: Container(
            color: Color.fromARGB(255, 87, 205, 138),
            height: context.screenHeight * 0.3,
            width: context.screenWidth * 0.2,
            child: Center(child: Text("Chater"))),
      ),
    ));
  }
}
