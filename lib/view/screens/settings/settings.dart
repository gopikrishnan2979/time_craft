import 'package:flutter/material.dart';
import 'package:time_craft/services/firebase/auth.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/screens/settings/about_us.dart';
import 'package:time_craft/view/screens/settings/privacy_policy.dart';
import 'package:time_craft/view/screens/settings/terms_and_conditions.dart';
import 'package:time_craft/view/screens/settings/widgets/settings_tile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  static const String routename = '/Settings';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCom(title: 'Settings'),
      body: SizedBox(
        width: double.infinity,
        height: khieght * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const AboutUs(),
                );
              },
              child: const SettingsTiles(icon: Icon(Icons.info), text: 'About'),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(PrivacyPolicy.routename);
              },
              child: const SettingsTiles(icon: Icon(Icons.shield_outlined), text: 'Privacy Policy'),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(TermsAndCondition.routename);
              },
              child: const SettingsTiles(icon: Icon(Icons.note), text: 'Terms & Conditions'),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    content: SizedBox(
                      height: khieght * 0.2,
                      child: Center(
                        child: SizedBox(
                            height: khieght * 0.05,
                            width: khieght * 0.05,
                            child: const CircularProgressIndicator()),
                      ),
                    ),
                  ),
                );
                Auth(context: context).signOut();
              },
              child: const SettingsTiles(icon: Icon(Icons.logout), text: 'Logout'),
            )
          ],
        ),
      ),
    ));
  }
}
