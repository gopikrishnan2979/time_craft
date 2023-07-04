import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class SettingsTiles extends StatelessWidget {
  const SettingsTiles({super.key, required this.icon, required this.text});
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      width: kwidth * 0.9,
      padding: const EdgeInsets.only(left: 20),
      height: 50,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: GoogleFonts.inter(fontWeight: FontWeight.w500),
              )
            ],
          )),
    );
  }
}
