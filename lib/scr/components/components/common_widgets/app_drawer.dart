import 'package:flutter/material.dart';
import '../constant/linker.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      width: screenWith * .75,
      backgroundColor: AppColors.whiteColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: AppColors.orangeColor,
              padding: EdgeInsets.symmetric(
                horizontal: screenWith * .04,
                vertical: screenHeight * .03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: screenWith * .07,
                    backgroundColor: AppColors.whiteColor.withOpacity(.9),
                  ),
                  SizedBox(height: screenHeight * .01),
                  BlackText(
                    text: "Arslan Qazi",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    textColor: AppColors.whiteColor,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWith * .04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * .02),

                      _DrawerItem(
                        icon: AppImages.home,
                        title: "Home",
                        onTap: () {
                          Navigator.of(context).pop();
                          //  Get.toNamed(AppRoutes.myProfileView);
                        },
                      ),

                      _DrawerItem(
                        icon: AppImages.profile,
                        title: "My Profile",
                        onTap: () {
                          Navigator.of(context).pop();
                            Get.toNamed(AppRoutes.myProfileView);
                        },
                      ),

                      _DrawerItem(
                        icon: AppImages.myServices,
                        title: "My Services",
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.toNamed(AppRoutes.myServicesView);
                        },
                      ),

                      _DrawerItem(
                        icon: AppImages.orders,
                        title: "Orders",
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),

                      _DrawerItem(
                        icon: AppImages.language,
                        title: "Language",
                        onTap: () {
                          Navigator.of(context).pop();
                           Get.toNamed(AppRoutes.languageView);
                        },
                      ),
                      _DrawerItem(
                        icon: AppImages.termAndConditions,
                        title: "Term and Conditions",
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.toNamed(AppRoutes.termsAndConditions);
                        },
                      ),
                      _DrawerItem(
                        icon: AppImages.privacyPolicy,
                        title: "Privacy policy",
                        onTap: () {
                          Navigator.of(context).pop();
                           Get.toNamed(AppRoutes.privacyPolicy);
                        },
                      ),

                      _DrawerItem(
                        icon: AppImages.wallet,
                        title: "Wallet",
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.toNamed(AppRoutes.walletView);
                        },
                      ),
                      _DrawerItem(
                        icon: AppImages.storeInbox,
                        title: "Inbox",
                        onTap: () {
                        Get.offNamed(AppRoutes.driverInbox);
                        },
                      ),
                      _DrawerItem(
                        icon: AppImages.logOut,
                        title: "Log out",
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(height: screenHeight * .02),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String icon;
  final String title;
  final String? fallbackIcon;
  final VoidCallback? onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    this.fallbackIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Widget leading = Image.asset(
      icon,
      width: screenWith * .05,
      height: screenWith * .05,
      errorBuilder: (_, __, ___) {
        if (fallbackIcon != null) {
          return Image.asset(
            fallbackIcon!,
            width: screenWith * .05,
            height: screenWith * .05,
          );
        }
        return SizedBox(width: screenWith * .05, height: screenWith * .05);
      },
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * .025),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            leading,
            SizedBox(width: screenWith * .035),
            Expanded(
              child: BlackText(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
