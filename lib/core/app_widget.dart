import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/dependency_injector/app_modules.dart';
import 'package:mobile_challenge/core/dependency_injector/dependency_injector.dart';
import 'package:mobile_challenge/presentation/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DependencyInjector dependencyInjector =
        AppModules.initDependencyInjector();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/splashPage",
      routes: RoutesName.routesName(dependencyInjector),
    );
  }
}
