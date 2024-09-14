import 'package:calender/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: Color(0xffE1DDD8),
        secondary: Color(0xffFF8702),
        //Мандарин
        onSecondary: Color(0xff919EAB),
        onPrimary: Color(0xffF2F2F2),
        //
        onSurface: Color(0xff4C4C69) //
        ),
    textTheme: GoogleFonts.nunitoTextTheme(),
    sliderTheme: const SliderThemeData(
      activeTrackColor: Color(0xffFF8702),
      valueIndicatorColor: Color(0xffFF8702),
      activeTickMarkColor: Colors.transparent,
      thumbColor: Color(0xffFF8702),
      overlayColor: Colors.white,
      // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
      tickMarkShape: RoundSliderTickMarkShape(
        tickMarkRadius: 0.0,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Color(0xffFF8702)),
      // overlayColor: Color(0xffFF8702),
    )));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MaterialApp(
      theme: theme,
      home: HomeScreen(),
    ),
  ));
}
