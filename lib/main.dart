



import 'package:flutter/material.dart';
import 'package:music/models/playlist_provider.dart';
import 'package:music/pages/home_page.dart';
import 'package:music/themes/light_mode.dart';
import 'package:music/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PlayListProvider())
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
      home:const HomePage() ,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}