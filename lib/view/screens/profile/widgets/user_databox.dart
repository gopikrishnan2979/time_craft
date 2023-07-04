import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class UserDataBox extends StatelessWidget {
  const UserDataBox({super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            width: kwidth * 0.8,
            padding: const EdgeInsets.only(left: 20),
            height: 40,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data,
                  style: inter,
                )),
          )
        ],
      ),
    );
  }
}
