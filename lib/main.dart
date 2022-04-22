import 'package:flutter/material.dart';
import 'package:linio_app/screens/screens.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'onboarding',
        routes: {
          'onboarding': (_) => OnboardignScreen(),
          'home': (_) => HomeScreen(),
          'product': (_) => ProductScreen(),
          'checkout': (_) => CheckOutScreen(),
          'main': (_) => MainScreen(),
        });
  }
}
