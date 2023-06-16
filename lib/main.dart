import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'core/controllers/controller.dart';
import 'pages/dashboard/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Command Interface',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: const Color.fromARGB(255, 14, 112, 151),
          ),
      home: const Center(
        // providers: [
        //   ChangeNotifierProvider(
        //     create: (context) => Controller(),
        //   )
        // ],
        child: DashboardPage(),
      ),
    );
  }
}
