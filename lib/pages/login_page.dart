// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';
import 'package:food_delivery/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // login method
  void login () async {
    // get instance of the auth service
    final _authService = AuthService();

    // try sign in
    try {
      await _authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }

    // display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }
// forgot password
  void forgotPw() {
    showDialog(context: context, builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: const Text("User tapped forgot password"),
    ),
    );
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
            const SizedBox(height: 50,),

            // message and app slogan
            Text("Food Delivery App",
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
            // password textfield

            const SizedBox(height: 10),

            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            // sign in button
            const SizedBox(height: 25),

            MyButton(
              onTap: login,
              text: "Login",
            ),

            const SizedBox(height: 25),
            // Not a member? Register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                  style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register Now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
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
