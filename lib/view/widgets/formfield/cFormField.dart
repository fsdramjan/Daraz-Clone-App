import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:flutter/material.dart';

Widget cFormField({
  Widget? prefixIcon,
  String? hintText,
  TextEditingController? controller,
  bool obscureText = false,
  String obscuringCharacter = '•',
  TextInputType? keyboardType,
  Color? borderColor,
  bool isFilled = true,
  Color? filledColor,
  TextStyle? hintStyle,
  Widget? suffixIcon,
  void Function(String)? onChanged,
  void Function(String)? onFieldSubmitted,
  void Function()? onTap,
  double? height,
  double? width,
  double? borderRadius,
  bool readOnly = false,
}) {
  return SizedBox(
    height: height ?? 45,
    width: width,
    child: TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.transparent,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: Apputils.paddingH10,
        fillColor: filledColor ?? AppColors.white,
        filled: isFilled,
      ),
    ),
  );
}
