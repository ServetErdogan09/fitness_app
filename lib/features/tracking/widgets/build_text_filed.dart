import 'package:flutter/material.dart';

Widget buildTextField(
  TextEditingController controller,
  String label,
  IconData icon,
) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.text,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      prefixIcon: Icon(icon, color: const Color(0xFF13EC5B), size: 20),
      filled: true,
      fillColor: Colors.white.withOpacity(0.05),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF13EC5B)),
      ),
    ),
  );
}
