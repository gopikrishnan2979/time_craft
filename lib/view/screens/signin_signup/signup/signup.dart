import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/signin_signup/signin/signin.dart';
import 'package:time_craft/view/screens/signin_signup/signup/widgets/signup_button_widget.dart';
import 'package:time_craft/view/screens/signin_signup/signup/widgets/signup_textfield_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String routename = '/Signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final TextEditingController _passwordconfirmcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kwidth * 0.02),
            child: SizedBox(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      ' Create a new account',
                      style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Center(
                      child: SizedBox(
                        height: khieght * 0.233,
                        child: Lottie.asset(
                          'assets/lotties/SignUp.json',
                        ),
                      ),
                    ),
                    TextfieldSignup(
                      nameController: _nameController,
                      emailcontroller: _emailcontroller,
                      passwordcontroller: _passwordcontroller,
                      phonecontroller: _phonecontroller,
                      confirmpasswordcontroller: _passwordconfirmcontroller,
                    ),
                    SignUpButton(
                        emailcontroller: _emailcontroller,
                        passwordcontroller: _passwordcontroller,
                        namecontroller: _nameController,
                        phonecontroller: _phonecontroller,
                        formkey: _formKey),
                    SizedBox(
                      height: khieght * 0.051,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Already have an account?",
                            style: interbold,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(SignInPage.routename);
                            },
                            child: Text(
                              "Sign In",
                              style: interbluebold,
                            ),
                          )
                        ],
                      ),
                    ),
                    sizedboxwithheight(khieght * 0.01)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phonecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _passwordconfirmcontroller.dispose();
    super.dispose();
  }
}
