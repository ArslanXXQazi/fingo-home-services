import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:flutter/services.dart';

class OtpFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? fillColor;
  final Color? textColor;

  const OtpFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.onNext,
    this.onPrevious,
    this.validator,
    this.borderColor,
    this.focusBorderColor,
    this.fillColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.12,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        validator: validator,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: textColor ?? AppColors.blackColor,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: fillColor ?? Colors.white,
          hintText: '-',
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor ?? AppColors.orangeColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor ?? AppColors.orangeColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: focusBorderColor ?? AppColors.orangeColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          errorStyle: TextStyle(height: 0),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            onNext?.call();
          } else if (value.isEmpty) {
            onPrevious?.call();
          }
        },
      ),
    );
  }
}
