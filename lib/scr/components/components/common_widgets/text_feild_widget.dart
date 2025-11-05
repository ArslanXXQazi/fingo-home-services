import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final int? maxLength;
  final int? maxLine;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? fillColor;
  final bool readOnly;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.maxLine,
    this.textColor,
    this.hintColor,
    this.borderColor,
    this.focusBorderColor,
    this.fillColor,
    this.readOnly = false,
    this.height,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final screenWidth = MediaQuery.of(context).size.width;

    Widget textFormField = TextFormField(
      controller: controller,
      obscureText: false,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      maxLength: maxLength,
      maxLines: maxLine ?? 1,
      style: TextStyle(
        color: textColor ?? AppColors.blackColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor ?? AppColors.greyColor,
        ),
        filled: true,
        fillColor: fillColor ?? Color(0XFF6B6B6B38).withOpacity(.22),
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? AppColors.transparentColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor ?? AppColors.transparentColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: focusBorderColor ?? AppColors.orangeColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null
            ? SizedBox(
          width: screenWidth * 0,
          height: screenWidth * 0,
          child: Center(child: prefixIcon),
        )
            : null,
        errorStyle: TextStyle(
          color: Colors.red,
        ),
      ),
    );

    if (isPassword) {
      textFormField = Obx(
            () => TextFormField(
          controller: controller,
          obscureText: !authController.isPasswordVisible.value,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly,
          maxLength: maxLength,
          maxLines: maxLine ?? 1,
          style: TextStyle(
            color: textColor ?? AppColors.blackColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor ?? AppColors.greyColor,
            ),
            filled: true,
            fillColor: fillColor ?? fillColor ?? Color(0XFF6B6B6B38).withOpacity(.25),
            contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? AppColors.transparentColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? AppColors.transparentColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: focusBorderColor ?? AppColors.orangeColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                authController.isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.greyColor,
              ),
              onPressed: authController.togglePasswordVisibility,
            ),
            prefixIcon: prefixIcon != null
                ? SizedBox(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              child: Center(child: prefixIcon),
            )
                : null,
            errorStyle: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      );
    }

    if (height != null) {
      return SizedBox(height: height, child: Center(child: textFormField));
    }
    return textFormField;
  }
}
