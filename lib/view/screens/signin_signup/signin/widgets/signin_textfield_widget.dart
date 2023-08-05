import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/obsecure_controller.dart';
import 'package:time_craft/services/firebase/auth.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/textfield_widget.dart';

class TextfieldSignin extends StatelessWidget {
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  const TextfieldSignin({
    super.key,
    required this.emailcontroller,
    required this.passwordcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedboxwithheight(20),
        Text('E-mail', style: interbold),
        sizedboxwithheight(10),
        TextFieldCustom(
          hint: 'Enter your email',
          controller: emailcontroller,
          inputType: TextInputType.emailAddress,
          isemail: true,
        ),
        sizedboxwithheight(20),
        Text('Password', style: interbold),
        sizedboxwithheight(10),
        ChangeNotifierProvider(
            create: (_) => ObsecureController(),
            child: Consumer<ObsecureController>(builder: (context, obsecureController, child) {
              return TextFieldCustom(
                hint: 'Enter your password',
                controller: passwordcontroller,
                inputType: TextInputType.visiblePassword,
                isobsecure: obsecureController.isObsecure,
                ispassword: true,
                suffix: IconButton(
                  constraints: BoxConstraints(minWidth: kwidth * 0.1, minHeight: 0.02),
                  onPressed: () {
                    obsecureController.toggleObsecure();
                  },
                  icon: Icon(obsecureController.isObsecure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                ),
              );
            })),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Auth(context: context).resetPassword(email: emailcontroller.text);
            },
            child: Text('Forget Password', style: interbluebold),
          ),
        ),
      ],
    );
  }
}
