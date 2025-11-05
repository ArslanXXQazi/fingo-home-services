



import 'package:fingodriver/scr/components/components/common_widgets/app_drawer.dart';
import 'package:fingodriver/scr/components/components/common_widgets/custom-appbar_2nd.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.find<HomeController>();
    
    // Get user data
    final String fullName = '${homeController.firstName.value} ${homeController.lastName.value}'.trim();
    final String mobileNumber = homeController.phoneNumber.value.isNotEmpty 
        ? homeController.phoneNumber.value 
        : '+2348135272669';
    final String email = homeController.contactEmailOrPhone.value.isNotEmpty 
        ? homeController.contactEmailOrPhone.value 
        : 'nellymichaelxx@gmail.com';
    // Note: gender field doesn't exist in HomeController yet, using empty string as default
    final String gender = ''; // homeController.gender.value;
    
    return Scaffold(
      drawer: AppDrawer(),
      appBar: CustomAppBar2nd(title: "MY PROFILE"),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.03),
              // Main Content Container
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.035,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Picture
                    Center(
                      child: CircleAvatar(
                        radius: screenWidth * 0.13,
                        backgroundColor: AppColors.greyColor.withOpacity(0.15),
                        child: Icon(
                          Icons.person,
                          size: screenWidth * 0.15,
                          color: AppColors.orangeColor,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // User Name
                    BlackText(
                      text: fullName.isNotEmpty ? fullName : 'Nelly Shaaho',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.blackColor,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Name Field
                    _InfoField(
                      icon: Icons.person_outline,
                      label: 'Name',
                      value: fullName.isNotEmpty ? fullName : 'Nelly Shaaho',
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Mobile Number Field
                    _InfoField(
                      icon: Icons.phone_outlined,
                      label: 'Mobile Number',
                      value: mobileNumber,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Email Field
                    _InfoField(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: email,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Gender Field
                    _InfoField(
                      icon: Icons.person_outline_rounded,
                      label: 'Gender',
                      value: gender.isEmpty ? 'male' : gender[0].toUpperCase() + gender.substring(1),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Divider
                    Container(
                      height: 1,
                      color: AppColors.orangeColor.withOpacity(0.15),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Document Button
                    _NavigationButton(
                      label: 'Document',
                      onTap: () {
                        Get.toNamed(AppRoutes.documentView);
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Edit Profile Button
                    OrangeButton(
                      onTap: () {
                        Get.toNamed(AppRoutes.editProfileView);
                      },
                      text: 'Edit Profile',
                      height: screenHeight * 0.06,
                      borderRadius: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

// Info Field Widget
class _InfoField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoField({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Container
        Container(
          width: screenWidth * 0.12,
          height: screenWidth * 0.12,
          decoration: BoxDecoration(
            color: AppColors.orangeColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.orangeColor,
              size: screenWidth * 0.06,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlackText(
                text: label,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: screenHeight * 0.006),
              BlackText(
                text: value,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Navigation Button Widget
class _NavigationButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavigationButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.018,
        ),
        decoration: BoxDecoration(
          color: AppColors.orangeColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.orangeColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: AppColors.orangeColor,
                  size: screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.03),
                BlackText(
                  text: label,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.blackColor,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.orangeColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chevron_right,
                color: AppColors.orangeColor,
                size: screenWidth * 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============ OLD CODE (COMMENTED OUT) ============
/*
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
*/
