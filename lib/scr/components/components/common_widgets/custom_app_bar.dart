import 'package:flutter/material.dart';
import '../constant/linker.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? fontSize;
  const CustomAppBar({super.key, required this.title,this.fontSize});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: (){ Get.back(); },
        icon: Icon(Icons.arrow_back_ios, color: AppColors.orangeColor),
      ),
      title: BlackText(
        text: title,
        fontSize: fontSize ?? 30,
        fontFamily: 'a',
        fontWeight: FontWeight.w400,
        textColor: AppColors.orangeColor,
      ),
      centerTitle: true,
    );
  }
}


