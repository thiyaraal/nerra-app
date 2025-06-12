import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:narra_apps/core/constants/color_styles.dart';

class AppTextStyles {
  static const Color _defaultColor = ColorStyles.text;

  static TextStyle regular(double size, {Color color = _defaultColor}) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle medium(double size, {Color color = _defaultColor}) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle bold(double size, {Color color = _defaultColor}) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  //logo
  static TextStyle logo(double size) {
    return GoogleFonts.josefinSlab(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: ColorStyles.primary,
      letterSpacing: 2.0,
    );
  }
}
