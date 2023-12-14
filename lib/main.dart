import 'package:flutter/material.dart';
import 'package:keyei/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyei/res/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KEYEI',
      theme: ThemeData(
          textTheme: GoogleFonts.robotoCondensedTextTheme(Theme.of(context).textTheme,),
          primaryColor: dark,
      ),
      initialRoute: '/init',
      routes: {'/init': (context) => const Login()},
    );
  }
}