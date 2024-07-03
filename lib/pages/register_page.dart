// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:food_delivery/services/auth/auth_service.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // register method
  void register() async {
    // get auth service
    final _authService = AuthService();

    // check if password match --> create user
    if (passwordController.text == confirmPasswordController.text) {
      // try creating the user
      try {
        await _authService.signUpWithEmailPassword(
            emailController.text,
            passwordController.text,
        );
      }
      // display errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
           title: Text(e.toString()),
        ),
        );
      }
    }

    // if password don't match --> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords doesn't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            // logo
            Icon(Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25,),

            // message and app slogan
            Text("Let's create an account for you",
              style: TextStyle(fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),
            // password textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 10),
            // confirm password textfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),

            // sign in button
            const SizedBox(height: 25),

            MyButton(text: "Sign Up",
              onTap: register,
            ),

            const SizedBox(height: 25),
            // Already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login Now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}
