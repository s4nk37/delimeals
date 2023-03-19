import 'package:flutter/material.dart';
import 'categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        // primarySwatch: Colors.deepOrange,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xfff25f5c),
          onPrimary: Color(0xff2D3142),
          secondary: Color(0xff70C1B3),
          onSecondary: Color(0xff353535),
          error: Colors.red,
          onError: Colors.white70,
          background: Color(0xffEADEDA),
          onBackground: Colors.black87,
          surface: Color(0xffc5c5c5),
          onSurface: Color(0xff2D3142),
        ),
        fontFamily: 'Open Sans',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Caveat',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      home: const CategoriesScreen(),
    );
  }
}
