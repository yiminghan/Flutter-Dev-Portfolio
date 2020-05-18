import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getFont(double size) {
  return GoogleFonts.inconsolata(
      textStyle: TextStyle(fontSize: size, color: Colors.white));
}
