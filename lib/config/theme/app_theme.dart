import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorSeed = Color(0xFF424CB8);
const scaffoldBackgroundColor = Color(0xFFF8F7F7);
const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.purple,
  Colors.red,
  Colors.deepPurple,
  Colors.orange,
  Colors.pinkAccent
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >=0, 'El color debe ser mayor a cero'),
    assert(selectedColor < colorList.length, 'El color debe ser menor a ${colorList.length - 1}');
  
  ThemeData getTheme() =>ThemeData(
    //*General
    useMaterial3: true,
    //colorSchemeSeed: colorSeed,
    colorSchemeSeed: colorList[selectedColor],


    //*Text
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserratAlternates()
        .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.montserratAlternates()
        .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
      titleSmall: GoogleFonts.montserratAlternates()
        .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
    ),

    //* Scaffold Background Color
    scaffoldBackgroundColor: scaffoldBackgroundColor,

    //* Buttons
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.montserratAlternates()
            .copyWith(fontWeight: FontWeight.w700)
        )
      )
    ),

    //* AppBar
    appBarTheme: AppBarTheme(
      color: scaffoldBackgroundColor,
      titleTextStyle: GoogleFonts.montserratAlternates()
        .copyWith(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)
    )
  );

  
 
}