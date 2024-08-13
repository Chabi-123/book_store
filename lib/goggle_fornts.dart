import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
myStyle(double fs,[Color ?clr,FontWeight ?fw]) {
  return GoogleFonts.oleoScript(
    fontSize: fs,
    color: clr,
    fontWeight: fw,
  );
}
style(double fs,[Color ?clr,FontWeight ?fw]) {
  return GoogleFonts.openSans(
    fontSize: fs,
    color: clr,
    fontWeight: fw,
  );
}