import 'package:flutter/material.dart';
import 'package:section_1/Profile/profile_widgets/user_model.dart';
import 'package:section_1/first_screen.dart';
import 'package:provider/provider.dart';

import 'Home/home_screen/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Showcase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: firstscreen(),

      // MyHomePage(title: 'The World of Automobiles'),
    );
  }
}
