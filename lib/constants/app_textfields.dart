import 'package:cradenthealth/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Inputfield extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? submitFun;
  final String? Function(String?)? onChanged;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? suffix;
  final Icon? prefixIcon;
  final int? maxLengths;
  final int? maxLetters; // Optional maxLetters parameter
  final Color? borderColor;
  final Color? fillColor;
  final Color? textColor;
  final bool isPasswordField;
  final bool? readOnly;
  final VoidCallback? onTap;

  const Inputfield({
    this.textInputFormatter,
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.suffix,
    this.fillColor,
    this.textColor,
    this.prefixIcon,
    this.maxLengths,
    this.maxLetters,
    this.submitFun,
    this.onChanged,
    this.borderColor,
    this.isPasswordField = false,
    this.readOnly = false,
    this.onTap,
  });

  @override
  _InputfieldState createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          child: TextFormField(
            obscureText: widget.isPasswordField ? _obscureText : false,
            onChanged: (text) {
              // Update the display and limit text to maxLetters if set
              if (widget.maxLetters != null &&
                  text.length > widget.maxLetters!) {
                final truncatedText = text.substring(0, widget.maxLetters!);
                widget.controller?.text = truncatedText;
                widget.controller?.selection = TextSelection.fromPosition(
                  TextPosition(offset: truncatedText.length),
                );
              }
              if (widget.onChanged != null) {
                widget.onChanged!(text);
              }
              setState(() {}); // Update the counter display
            },
            textInputAction: TextInputAction.done,
            onFieldSubmitted: widget.submitFun,
            inputFormatters: [
              if (widget.maxLetters != null)
                LengthLimitingTextInputFormatter(widget.maxLetters),
              ...?widget.textInputFormatter,
            ],
            maxLines: widget.isPasswordField ? 1 : widget.maxLengths,
            style: GoogleFonts.robotoFlex(
                color: widget.textColor ?? AppColors.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            validator: widget.validator,
            readOnly: widget.readOnly ?? false,
            onTap: widget.onTap,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.blackColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: widget.fillColor ?? AppColors.whiteColor,
              filled: true,
              labelText: widget.label,
              hintText: widget.hinttext,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : widget.suffix,
              hintStyle: GoogleFonts.poppins(
                  color: AppColors.greyColor1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              labelStyle: GoogleFonts.poppins(
                  color: AppColors.greyColor1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            keyboardType: widget.keyboardType,
          ),
        ),
        if (widget.maxLetters !=
            null) // Display the counter only if maxLetters is set
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0, right: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${widget.controller?.text.length ?? 0} / ${widget.maxLetters}', // Show current count / max
                style: GoogleFonts.montserrat(
                    color: AppColors.greyColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
      ],
    );
  }
}
