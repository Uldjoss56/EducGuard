import 'package:eduguard/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldCard extends StatelessWidget {
  const TextFormFieldCard({
    super.key,
    this.controller,
    this.maxLines,
    this.textInputType,
    this.obscureText = false,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType? textInputType;
  final bool obscureText;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.raleway(color: myGrisFonce),
      controller: controller,
      maxLines: maxLines,
      keyboardType: textInputType,
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.raleway(color: myGrisFonce),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
