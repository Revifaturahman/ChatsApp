import 'package:chatsapp/widgets/my_teksfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginpage extends StatelessWidget {
  //email dan pw controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(height: 50),

            //welcome back text
            Text(
              "Welcome back , you've been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25),
            //email textfield
            Myteksfield(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),

            //password textfield
            Myteksfield(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),

            //login button

            //register now
          ],
        ),
      ),
    );
  }
}
