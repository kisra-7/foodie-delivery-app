import 'package:app/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../components/cust_button.dart';
import '../components/my_field.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  void signUp(BuildContext context) {
    final _authServices = AuthServices();
    if (_pwController.text == _confirmpwController.text) {
      try {
        _authServices.signUp(_emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Lottie.asset('assets/lot2.json', width: 300, height: 300),

              // message

              Text(
                'FOODIE',
                style: GoogleFonts.cedarvilleCursive(
                    fontSize: 50,
                    color: Colors.red[700],
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),

              // email textfield
              MyField(
                  controller: _emailController,
                  hintText: 'Enter Email',
                  isObscure: false)
              //passwors textfield
              ,
              const SizedBox(
                height: 25,
              ),

              // email textfield
              MyField(
                  controller: _pwController,
                  hintText: 'Enter Password',
                  isObscure: true)
              //sign in buttn
              ,

              const SizedBox(
                height: 25,
              ),

              // email textfield
              MyField(
                  controller: _confirmpwController,
                  hintText: 'Confirm Password',
                  isObscure: true)
              //sign in buttn
              ,
              const SizedBox(
                height: 25,
              ),
              CustButton(
                text: 'Sign Up',
                onTap: () => signUp(context),
              ),

              // not a member
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
