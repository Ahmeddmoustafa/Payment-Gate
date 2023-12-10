import 'package:flutter/material.dart';
import 'package:payment_app/Presentation/Home/home_page.dart';
import 'package:payment_app/Resources/Managers/routes_manager.dart';
import 'package:payment_app/Resources/Theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment App',
      theme: getApplicationtheme(false),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.mainRoute,
      // home: const HomePage(),
    );
  }
}
