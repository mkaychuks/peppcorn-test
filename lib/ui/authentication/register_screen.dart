import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pep_test/services/authentication_service.dart';
import 'package:pep_test/ui/screens.dart';
import 'package:pep_test/widgets/custom_button.dart';
import 'package:pep_test/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  Future createUser(String email, String password) async {
    try {
      await AuthenticationMethods()
          .createUserInDb(email: email, password: password, context: context);
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
                "Please register your presence",
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
                  createUser(email, password).then((value) => clearFields());
                },
                title: "Register",
              ),

              // the navigate back button
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Login instead",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
