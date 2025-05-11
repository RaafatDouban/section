import 'package:flutter/material.dart';
import 'package:section_1/Profile/profile_widgets/user_model.dart';
import 'package:section_1/dashboard/dashboard_screen.dart';

import 'package:provider/provider.dart';
import 'package:section_1/dashboard/nav_bar.dart';
import 'add_item/item_model.dart';
import 'favourite/favourite_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
        ChangeNotifierProvider(create: (context) => FavouriteModel()),
      ],
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
      home: NavBar(),

      // MyHomePage(title: 'The World of Automobiles'),
    );
  }
}
