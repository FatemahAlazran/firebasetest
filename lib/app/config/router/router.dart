import 'package:firebasetest/app/config/router/my_named_route.dart';
import 'package:firebasetest/app/modules/auth/views/login.dart';
import 'package:firebasetest/app/modules/auth/views/register.dart';
import 'package:firebasetest/app/modules/auth/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///[rootNavigatorKey] used for global | general navigation
final rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const SizedBox();

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: MyNamedRoutes.root, //  "/"
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // outside the [ShellRoute] to make the screen on top of the [BottomNavBar]
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyNamedRoutes.root,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyNamedRoutes.register,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: Register(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.login}",
        name: MyNamedRoutes.login,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
    ],
    errorBuilder: errorWidget,
  );
  // to navigate page from class that dont have context
  //get(){
  //try{
  //
  //}  catch(e) {
  // if(e.statuscode==403){

  // rootNavigatorKey.currentstate.context.PushName(MyNamedRoutes.root);}
  //}
  //}
//
//
  static GoRouter get router => _router; //geter

//to navigate from page to another:
  //context.pushName(MyNamedRoute.root);
  //GoRouter.of(context).PushName(MyNamedRoute.root)
}
