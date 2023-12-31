import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class AppbarCom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  const AppbarCom({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      surfaceTintColor: white,
      elevation: 3,
      actions: action ?? [],
      shadowColor: black,
      leadingWidth: kwidth * 0.13,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_outlined, size: 30),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
