import 'package:flutter/material.dart';
import 'package:kang/router.dart';
import 'package:kang/views/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = AutoRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(1, 0, 109, 66)),
        useMaterial3: true,
      ),
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
