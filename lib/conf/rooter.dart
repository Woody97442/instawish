import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/homeScreen.dart';
import '../screens/loginScreen.dart';

class Rooter extends StatelessWidget {
  const Rooter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        }),
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
  ],
);
