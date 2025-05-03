import 'package:flutter/material.dart';
import 'package:section_1/Profile/profile_widgets/user_model.dart';
import 'package:section_1/dashboard/dashboard_screen.dart';
import 'package:section_1/add_item/add_item_screen.dart';
import 'package:provider/provider.dart';
import 'add_item/item_model.dart';
import 'details/details_screen/details_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
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
      home: DashboardScreen(),

      // MyHomePage(title: 'The World of Automobiles'),
    );
  }
}
