import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/screens/home/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SpotifyApp());
}

class SpotifyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Proxima Nova'),
      home: HomeScreen(),
    );
  }
}
