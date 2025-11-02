

import '../constant/linker.dart';


class OrangeButton extends StatelessWidget {
  VoidCallback onTap;
  String text;
  double? height;
  double? width;
  double? fontSize;
  double? borderRadius;
  String? image;
  Color? color;
  String? fontFamily;
  Color? imagecolor;
  Color? borderColor;
  Color? textColor;
  FontWeight fontWeight;

  OrangeButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.fontSize,
    this.color ,
    this.imagecolor,
    this.borderColor,
    this.fontFamily,
    this.textColor ,
    this.fontWeight = FontWeight.w500,
    this.image,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ??screenHeight*.06,
        decoration: BoxDecoration(
          color: color ?? AppColors.orangeColor,
          border: Border.all(color: borderColor ?? Colors.transparent,width: 2),
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(image!,width: screenWidth*.07,),
                ),
              BlackText(
                text: text,
                textColor: textColor ?? Colors.white,
                fontSize: fontSize ?? 16,
                fontWeight: FontWeight.w700,
                fontFamily: fontFamily,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
