import 'package:app/components/cust_button.dart';
import 'package:app/components/my_field.dart';
import 'package:app/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  void signIn(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _authServices = AuthServices();

    try {
      await _authServices.signIn(_emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            'Email or password is incorrect',
          ),
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
          padding: const EdgeInsets.only(bottom: 60, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo

                Lottie.asset('assets/lot1.json', height: 350),

                // message

                Text(
                  'FOODIE',
                  style: GoogleFonts.cedarvilleCursive(
                      fontSize: 50,
                      color: Colors.red[700],
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
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
                CustButton(
                  text: 'Sign in',
                  onTap: () => signIn(context),
                ),

                // not a member
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an a count "),
                    GestureDetector(
                      onTap: onTap,
                      child: const Text(
                        'Create Account',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
