import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppHelper {
  // Show SnackBar
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color backgroundColor = BAppColors.primary,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor),
    );
  }

  // Show Alert Dialog
  static Future<void> showAlert(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = "OK",
  }) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  // Hide Keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  // Email Validator
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  // Format Date
  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // Format Time
  static String formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }
}
