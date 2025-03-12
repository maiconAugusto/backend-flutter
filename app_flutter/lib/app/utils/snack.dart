import 'package:flutter/material.dart';

void showError({
  required BuildContext context,
  required String message,
}) {
  SnackBar snackBar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(message),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
