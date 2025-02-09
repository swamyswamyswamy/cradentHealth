import 'package:cradenthealth/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T>? dropdownItems;
  final String Function(T item)? getItemName;
  final String Function(T item)? getItemId;
  final T? initialValue;
  final String? hintName;
  final Color? iconColor;
  final Color? fillColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Function(T?)? onChanged;
  final double? height;
  final double? borderRadius;

  const CustomDropdown({
    super.key,
    this.dropdownItems,
    this.getItemName,
    this.getItemId,
    this.initialValue,
    this.hintName,
    this.iconColor,
    this.fillColor,
    this.hintTextColor,
    this.textColor,
    this.onChanged,
    this.height = 55.0,
    this.borderRadius = 12.0,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.fillColor ?? AppColors.secondaryColor,
        border: Border.all(color: AppColors.secondaryColor),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
      ),
      child: DropdownButtonFormField<T>(
        value: widget.initialValue,
        items: widget.dropdownItems?.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(widget.getItemName?.call(item) ?? ''),
          );
        }).toList(),
        onChanged: widget.onChanged,
        dropdownColor: Colors.white,
        style: GoogleFonts.poppins(
          color: widget.textColor ?? Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        icon: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Icon(
            Icons.expand_more,
            color: widget.iconColor ?? Colors.black,
          ),
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          hintText: widget.initialValue == null ? widget.hintName ?? '' : null,
          hintStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: widget.hintTextColor?.withOpacity(0.4) ?? Colors.grey,
            fontSize: 12,
          ),
          filled: true,
          fillColor: widget.fillColor ?? AppColors.secondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            borderSide: BorderSide(
                color:
                    widget.fillColor?.withOpacity(0.1) ?? Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            borderSide: BorderSide(
                color:
                    widget.fillColor?.withOpacity(0.1) ?? Colors.transparent),
          ),
        ),
      ),
    );
  }
}
