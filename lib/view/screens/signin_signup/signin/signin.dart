import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/common/widgets/network_error_widget.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/signin_signup/signup/signup.dart';
import 'package:time_craft/view/screens/signin_signup/signin/widgets/signin_buttons.dart';
import 'package:time_craft/view/screens/signin_signup/signin/widgets/signin_textfield_widget.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const String routename = '/Signin';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: khieght * 0.01),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Login',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  NetworkErrorWidget(replacement: sizedboxwithheight(khieght * 0.05)),
                  Center(
                      child: SizedBox(
                    height: khieght * 0.28,
                    child: Lottie.asset('assets/lotties/SignIn.json', fit: BoxFit.fitHeight),
                  )),
                  Form(
                    key: _formkey,
                    child: TextfieldSignin(
                      emailcontroller: _emailcontroller,
                      passwordcontroller: _passwordcontroller,
                    ),
                  ),
                  SignInButton(
                    formkey: _formkey,
                    emailcontroller: _emailcontroller,
                    passwordcontroller: _passwordcontroller,
                  ),
                  SizedBox(
                    height: khieght * 0.07,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Don't have account?", style: interbold),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(SignUpPage.routename);
                          },
                          child: Text("Create account", style: interbluebold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }
}
