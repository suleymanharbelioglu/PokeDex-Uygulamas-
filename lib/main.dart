//https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json  => api adress
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v201/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(532, 720),
      builder: (context, child) => MaterialApp(
        theme:
            ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme()),
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        home: HomePage(),
      ),
    );
  }
}
