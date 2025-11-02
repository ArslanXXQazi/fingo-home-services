import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/linker.dart';

class SocialLoginsButtons extends StatelessWidget {
  const SocialLoginsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(onTap: (){},image: AppImages.google),
        CustomIconButton(onTap: (){},image: AppImages.facebook),
        CustomIconButton(onTap: (){},image: AppImages.apple),
      ],);
  }
}

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String image;

  const CustomIconButton({super.key,
    required this.onTap,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight*.07,
      width: screenWith*.15,
      margin: EdgeInsets.symmetric(horizontal: screenWith*.02),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300)
      ),
      child: IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset(image,width: screenWith*.06,)),
    );
  }
}
