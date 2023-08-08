import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/userdata_controllers/obsecure_controller.dart';
import 'package:time_craft/view/common/widgets/textfield_widget.dart';
import 'package:time_craft/view/core/styles.dart';

class TextfieldSignup extends StatelessWidget {
  const TextfieldSignup({
    super.key,
    required this.confirmpasswordcontroller,
    required this.emailcontroller,
    required this.phonecontroller,
    required this.nameController,
    required this.passwordcontroller,
  });
  final TextEditingController nameController;
  final TextEditingController emailcontroller;
  final TextEditingController phonecontroller;
  final TextEditingController passwordcontroller;
  final TextEditingController confirmpasswordcontroller;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedboxwithheight(khieght * 0.01),
          textfieldheading(text: 'Name'),
          TextFieldCustom(hint: 'Enter Your Name', controller: nameController, isname: true),
          sizedboxwithheight(khieght * 0.01),
          textfieldheading(text: 'Phone'),
          TextFieldCustom(hint: 'Enter Your Phone no.', controller: phonecontroller, isphone: true),
          sizedboxwithheight(khieght * 0.01),
          textfieldheading(text: 'Email'),
          TextFieldCustom(hint: 'Enter Your Email', controller: emailcontroller, isemail: true),
          sizedboxwithheight(khieght * 0.01),
          textfieldheading(text: 'Password'),
          ChangeNotifierProvider(
              create: (context) => ObsecureController(),
              child: Consumer<ObsecureController>(builder: (context, obsecureController, child) {
                return TextFieldCustom(
                  hint: 'Enter Your Password',
                  controller: passwordcontroller,
                  isobsecure: obsecureController.isObsecure,
                  ispassword: true,
                  suffix: IconButton(
                    constraints: BoxConstraints(minWidth: kwidth * 0.1, minHeight: 0.02),
                    onPressed: () {
                      obsecureController.toggleObsecure();
                    },
                    icon: Icon(
                      obsecureController.isObsecure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                );
              })),
          sizedboxwithheight(khieght * 0.01),
          textfieldheading(text: 'Confirm Password'),
          ChangeNotifierProvider(
            create: (context) => ObsecureController(),
            child: Consumer<ObsecureController>(builder: (context, obsecureController, child) {
              return TextFieldCustom(
                hint: 'Re-Enter Your Password',
                controller: confirmpasswordcontroller,
                isobsecure: obsecureController.isObsecure,
                suffix: IconButton(
                  constraints: BoxConstraints(minWidth: kwidth * 0.1, minHeight: 0.02),
                  onPressed: () {
                    obsecureController.toggleObsecure();
                  },
                  icon: Icon(obsecureController.isObsecure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                ),
                passwordgiven: passwordcontroller.text.trim(),
                isconfirmpassword: true,
              );
            }),
          ),
          sizedboxwithheight(khieght * 0.03),
        ],
      );
    });
  }

  Widget textfieldheading({required String text}) {
    return Text(text, style: interbold);
  }
}
