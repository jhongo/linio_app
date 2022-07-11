import 'package:flutter/material.dart';
import 'package:linio_app/screens/screens.dart';
import 'package:linio_app/services/menu_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuService(),
        )
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          initialRoute: 'onboarding',
          routes: {
            'onboarding': (_) => OnboardignScreen(),
            'home': (_) => HomeScreen(),
            'product': (_) => ProductScreen(),
            'checkout': (_) => CheckOutScreen(),
            'main': (_) => MainScreen(),
          }),
    );
  }
}
