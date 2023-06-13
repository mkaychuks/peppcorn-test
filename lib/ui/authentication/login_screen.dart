import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pep_test/services/authentication_service.dart';
import 'package:pep_test/widgets/custom_button.dart';
import 'package:pep_test/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void clearFields(){
    emailController.clear();
    passwordController.clear();
  }

  Future loginUser(String email, String password) async {
    try {
      await AuthenticationMethods()
          .loginUser(email: email, password: password, context: context);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 100),

              // the online register welcome note
              const FlutterLogo(size: 40),
              const SizedBox(height: 16),
              const Text(
                "Welcome to PeppCorn",
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),

              // the congratulations
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Log in to your account",
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),

              // the input fields
              const SizedBox(height: 40),

              CustomTextField(
                labelText: "Email",
                icon: Icons.mail,
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                labelText: "Password",
                icon: Icons.lock,
                obscureText: true,
                controller: passwordController,
              ),

              // the button
              const SizedBox(height: 20),
              CustomButton(
                onTap: () async {
                  var email = emailController.text;
                  var password = passwordController.text;
                  loginUser(email, password).then((value) => clearFields);
                },
                title: "Login",
              ),

              // the navigate back button
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Register instead",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
