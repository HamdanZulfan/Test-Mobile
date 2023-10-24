import 'package:flutter/material.dart';
import 'package:test_flutter/utils/theme.dart';

void showTextMessage(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
