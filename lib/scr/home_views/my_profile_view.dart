



import 'package:fingodriver/scr/components/components/common_widgets/app_drawer.dart';
import 'package:fingodriver/scr/components/components/common_widgets/confirm_dialog.dart';
import 'package:fingodriver/scr/components/components/common_widgets/custom-appbar_2nd.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: CustomAppBar2nd(title: "MY PROFILE"),

      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth*.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight*.03),
            // Profile avatar with camera badge
            Row(children: [

              Container(
                height: screenHeight*.15,
                width: screenWidth*.4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth*.13,
                      backgroundColor: const Color(0xFFD9D9D9),
                    ),
                    Positioned(
                      right: screenWidth*.08,
                      bottom: screenWidth*.03,
                      child: GestureDetector(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: screenWidth*.04,
                          backgroundColor: AppColors.orangeColor,
                          child: SvgPicture.asset(AppImages.camera,width: screenWidth*.055,color: AppColors.whiteColor,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight*.15,
                width: screenWidth*.4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth*.13,
                      backgroundColor: const Color(0xFFD9D9D9),
                    ),
                    Positioned(
                      right: screenWidth*.08,
                      bottom: screenWidth*.03,
                      child: GestureDetector(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: screenWidth*.04,
                          backgroundColor: AppColors.orangeColor,
                          child: SvgPicture.asset(AppImages.camera,width: screenWidth*.055,color: AppColors.whiteColor,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],),
            BlackText(
              text: "abc asd",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textColor: AppColors.blackColor,
            ),
            SizedBox(height: screenHeight*.1),

            // Options list
            _OptionRow( onTap: (){
              Get.toNamed(AppRoutes.accountDetailView);
            }, icon: AppImages.profile, label: 'Account Details'),
            SizedBox(height: screenHeight*.025),
            _OptionRow(onTap: (){
              Get.toNamed(AppRoutes.contactUsView);
            }, icon: AppImages.contactUs, label: 'ContactUs'),
            SizedBox(height: screenHeight*.025),
            _OptionRow(onTap: (){
              showConfirmDialog(
                context: context,
                title: 'Account delete',
                message: 'Are you sure want to delete Account.',
                onOk: (){},
              );
            }, icon: AppImages.delete, label: 'Delete Account'),

            const Spacer(),

            OrangeButton(
              onTap: (){
                showConfirmDialog(
                  context: context,
                  title: 'Log out',
                  message: 'Are you sure you want to log out?',
                  onOk: (){},
                );
              },
              text: 'Log Out',
              color: AppColors.whiteColor,
              textColor: AppColors.blackColor,
              borderColor: AppColors.orangeColor,
              height: screenHeight*.06,
              borderRadius: 15,
            ),
            SizedBox(height: screenHeight*.07),
          ],
        ),
      )),
    );

  }
}

class _OptionRow extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  const _OptionRow({required this.icon, required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image.asset(icon, width: screenWidth*.05),
        SizedBox(width: screenWidth*.03),
        Expanded(
          child: BlackText(
            onTap: onTap,
            text: label,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            textColor: AppColors.blackColor,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
