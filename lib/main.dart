import 'package:flutter/material.dart';
import 'package:travel_ui/travel_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TravelPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.lightGreen[300],
        primaryColor: Colors.amber[800],
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    );
  }
}
