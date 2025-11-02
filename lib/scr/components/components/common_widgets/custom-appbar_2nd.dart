import 'package:flutter/material.dart';
import '../constant/linker.dart';

class CustomAppBar2nd extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar2nd({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Builder(
            builder: (ctx) => GestureDetector(
              onTap: () {
                Scaffold.of(ctx).openDrawer();
              },
              child: CircleAvatar(
                radius: screenWith*.05,
                backgroundColor: AppColors.orangeColor,
                child: SvgPicture.asset(AppImages.more,width: screenWith*.05,),
              ),
            ),
          ),
          Spacer(),
          BlackText(
            text: title,
            textColor: AppColors.orangeColor,
            fontWeight: FontWeight.w400,
            fontSize: 30,
            fontFamily: 'a',
          ),
          Spacer(),
        ],
      ),
    );
  }
}


