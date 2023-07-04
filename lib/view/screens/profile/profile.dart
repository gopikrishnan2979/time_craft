import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/screens/profile/widgets/user_databox.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  static const String routename = '/Profile';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarCom(
          title: 'Profile',
          action: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: black,
                ))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
                height: khieght * 0.28,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: khieght * 0.09,
                    backgroundImage:
                        const AssetImage('assets/images/unknown.jpg'),
                  ),
                )),
            Text(
              'User Name',
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            sizedboxwithheight(30),
            const UserDataBox(title: 'Name', data: 'Username'),
            const UserDataBox(title: 'Email', data: 'Useremail@gmail.com'),
            const UserDataBox(title: 'Phone', data: 'XXXXXXXXXX')
          ],
        ),
      ),
    );
  }
}
