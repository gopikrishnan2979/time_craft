import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, required this.ontap, required this.icon, required this.title});
  final Function()? ontap;
  final Icon icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: icon,
      title: Text(title, style: inter),
    );
  }
}
