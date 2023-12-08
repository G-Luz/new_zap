import 'package:flutter/material.dart';
import 'package:new_zap/constants/app_colors.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    Key? key,
    this.height = 50,
    this.width,
    this.hint,
    this.initialValue,
    this.errorText,
    this.enable = true,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.borderColor = AppColors.darkBlue,
    this.suffixIcon,
    this.preffixIcon,
    this.maxLines,
    this.controller,
    this.onTapCallback,
    this.onChanged,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? hint;
  final String? initialValue;
  final String? errorText;
  final bool enable;
  final bool readOnly;
  final bool obscureText;
  final TextInputType keyboardType;
  final Color borderColor;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final int? maxLines;
  final TextEditingController? controller;
  final VoidCallback? onTapCallback;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        keyboardType: keyboardType,
        enabled: enable,
        readOnly: readOnly,
        style: const TextStyle(
          fontSize: 15,
        ),
        maxLines: maxLines,
        obscureText: obscureText,
        onTap: onTapCallback,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: borderColor,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: preffixIcon,
        ),
      ),
    );
  }
}
