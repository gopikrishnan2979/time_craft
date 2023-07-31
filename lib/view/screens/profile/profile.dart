import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/screens/profile/widgets/user_databox.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  static const String routename = '/Profile';

  @override
  Widget build(BuildContext context) {
    const String backgroundImage =
        'https://htmlcolorcodes.com/assets/images/colors/bright-blue-color-solid-background-1920x1080.png';
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(
          title: 'Profile',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StreamBuilder(
                stream: FirebaseInstanceModel.user.doc(FirebaseInstanceModel.uid).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Loading();
                  }
                  return Column(
                    children: [
                      SizedBox(
                          height: khieght * 0.28,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                radius: khieght * 0.05,
                                backgroundImage:
                                    NetworkImage(snapshot.data?['image'] ?? backgroundImage),
                                child: Center(
                                  child: snapshot.data!['image'] == null
                                      ? Text(
                                          snapshot.data!['name'][0],
                                          style: GoogleFonts.inter(
                                            fontSize: 50,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                              ))),
                      Text(
                        snapshot.data!['name'] as String,
                        style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      sizedboxwithheight(30),
                      UserDataBox(title: 'Name', data: snapshot.data?['name'] ?? '', isName: true,ctx: context),
                      UserDataBox(
                          title: 'Email', data: snapshot.data?['email'] ?? '', isEmail: true,ctx: context),
                      UserDataBox(
                          title: 'Phone', data: snapshot.data?['phone'] ?? '', isPhone: true,ctx: context),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
