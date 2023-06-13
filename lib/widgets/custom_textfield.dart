// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText:labelText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
