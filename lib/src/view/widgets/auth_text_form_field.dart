// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  final bool obscureText;
  Widget? icon;
  AuthTextFormField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon,
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
