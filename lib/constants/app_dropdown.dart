import 'package:cradenthealth/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> dropdownItems;
  final String Function(T item) getItemName; // Function to get display name
  final String Function(T item) getItemId; // Function to get ID
  final T? initialValue; // Allow null for initialValue
  final String hintName; // Hint text when no selection
  final Color iconColor;
  final Color fillColor;
  final Color hintTextColor;
  final Color textColor;
  final Function(T?)? onChanged; // Allow null values
  final double? height; // Optional height parameter
  final double? borderRadius; // Optional borderRadius parameter

  const CustomDropdown({
    super.key,
    required this.dropdownItems,
    required this.getItemName,
    required this.getItemId,
    this.initialValue, // Nullable initial value
    required this.hintName,
    required this.iconColor,
    required this.fillColor,
    required this.hintTextColor,
    required this.textColor,
    this.onChanged,
    this.height = 55.0, // Default height if not provided
    this.borderRadius = 12.0, // Default border radius if not provided
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
        color: widget.fillColor,
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
      ),
      child: DropdownButtonFormField<T>(
        value: widget.initialValue, // Set the value based on the selected item
        items: widget.dropdownItems.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(widget.getItemName(item)),
          );
        }).toList(),
        onChanged: (T? newValue) {
          widget.onChanged
              ?.call(newValue); // Call the callback with the new value
        },
        dropdownColor: Colors.white,
        style: GoogleFonts.montserrat(
          color: widget.textColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        icon: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Icon(
            Icons.expand_more,
            color: widget.iconColor,
          ),
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          hintText: widget.initialValue == null
              ? widget.hintName
              : null, // Show hint if no selection
          hintStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: widget.hintTextColor.withOpacity(0.4),
            fontSize: 12,
          ),
          filled: true,
          fillColor: widget.fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            borderSide: BorderSide(
                color: widget.fillColor.withOpacity(0.1) ?? Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            borderSide: BorderSide(
                color: widget.fillColor.withOpacity(0.1) ?? Colors.transparent),
          ),
        ),
      ),
    );
  }
}
