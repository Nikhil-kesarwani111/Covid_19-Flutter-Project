//import 'package:covd_19/view/countries_list.dart';
//import 'package:covd_19/view/detail_screen.dart';
import 'package:covd_19/view/splash_screen.dart';
//import 'package:covd_19/view/word_states.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),

      // initialRoute: SplashScreen.id,
      // routes: {
      //   SplashScreen.id:(context)=>SplashScreen(),
      //   WorldStateScreen.id:(context)=>WorldStateScreen(),
      //   CountryListScreen.id:(context)=>CountryListScreen(),
      //
      // },
      //home: SplashScreen(),
    );
  }
}
