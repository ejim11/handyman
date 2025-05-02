import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handyman/screens/welcome/first_screen.dart';

// choosing a color scheme for light mode
var kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.white,
    surface: Colors.white,
    onSurface: const Color.fromRGBO(87, 91, 95, 1),
    primaryContainer: const Color.fromRGBO(249, 249, 249, 1));

// choosing a color scheme for dark mode
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.black,
    surface: const Color.fromRGBO(31, 31, 31, 1),
    onSurface: const Color.fromRGBO(255, 255, 255, 1),
    primaryContainer: const Color.fromRGBO(35, 35, 35, 1));

void main() {
  // This makes the orientation of the device to be fixed
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HandyMan',
      // setting the dark theme
      darkTheme: ThemeData.dark().copyWith(
        // setting the color scheme for the dark theme
        colorScheme: kDarkColorScheme,
        textTheme: GoogleFonts.robotoSlabTextTheme(
          ThemeData.dark().textTheme, // This ensures text color is white
        ),
      ),
      // setting the defualt theme which is the light theme
      theme: ThemeData().copyWith(
        // setting the color scheme for the light theme
        colorScheme: kColorScheme,

        textTheme: GoogleFonts.robotoSlabTextTheme(
          ThemeData.light().textTheme, // This ensures text color is black
        ),
      ),
      // choosing theme based of the systems theme
      themeMode: ThemeMode.light,
      home: const FirstScreen(),
    );
  }
}
