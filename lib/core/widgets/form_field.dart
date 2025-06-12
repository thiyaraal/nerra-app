import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  final bool? obscureText;
  const CustomFormField({
    super.key,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    this.obscureText,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: widget.obscureText ?? false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: const Color(0xFF7A86B6), width: 1.5),
          ),
        ),
      ),
    );
  }
}
