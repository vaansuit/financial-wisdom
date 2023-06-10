// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  void Function()? onPressed;
  final String text;
  AuthElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(
          250,
          50,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
