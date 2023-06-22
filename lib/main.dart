import 'package:command_interface/core/routes/app_routers.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'core/controllers/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Command Interface',
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: Colors.teal,
          ),
    );
  }
}
