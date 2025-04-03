import 'package:flutter/material.dart';

class SnackbarDelete {
  static void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tarea eliminada'))
    );
  }
}
