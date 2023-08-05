import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//const color used in the code

const Color white = Colors.white;
const Color black = Colors.black;
const Color addingColor = Color.fromARGB(121, 30, 255, 113);
const Color removingColor = Color.fromARGB(122, 255, 30, 30);

// size of the screen initialized during the entering

late double khieght;
late double kwidth;

//textstyles used in code

final interbold = GoogleFonts.inter(fontWeight: FontWeight.bold, color: black);
final inter = GoogleFonts.inter(color: black);
final interwhite = GoogleFonts.inter(color: white);
final interwhitebold = GoogleFonts.inter(color: white, fontWeight: FontWeight.bold);
final inter14bold = GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold);
final inter16bold = GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold);
final intergreenbold = GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.green);
final interbluebold =
    GoogleFonts.inter(color: const Color(0xFF3964FC), fontWeight: FontWeight.bold);
final inter14greenbold =
    GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green);
//sized box with specific height

sizedboxwithheight(double? height) {
  return SizedBox(height: height);
}
