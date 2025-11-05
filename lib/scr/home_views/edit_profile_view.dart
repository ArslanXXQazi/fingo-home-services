import 'package:fingohomeservices/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingohomeservices/scr/components/components/common_widgets/gender_selector.dart';
import 'package:fingohomeservices/scr/components/components/constant/linker.dart';
import 'package:fingohomeservices/scr/controllers/edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final EditProfileController controller = Get.put(EditProfileController());

    return Scaffold(
      appBar: CustomAppBar(title: "EDIT PROFILE"),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03),
                // Profile Picture Section
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.13,
                        backgroundColor: AppColors.greyColor.withOpacity(0.15),
                        child: Icon(
                          Icons.person,
                          size: screenWidth * 0.15,
                          color: AppColors.orangeColor,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            // Add image picker functionality here
                          },
                          child: Container(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            decoration: BoxDecoration(
                              color: AppColors.orangeColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: AppColors.whiteColor,
                              size: screenWidth * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // First Name Field
                BlackText(
                  text: 'First Name',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFieldWidget(
                  controller: controller.firstNameController,
                  hintText: 'Enter first name',
                  fillColor: AppColors.whiteColor,
                  borderColor: AppColors.orangeColor,
                  focusBorderColor: AppColors.orangeColor,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
                // Last Name Field
                BlackText(
                  text: 'Last Name',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFieldWidget(
                  controller: controller.lastNameController,
                  hintText: 'Enter last name',
                  fillColor: AppColors.whiteColor,
                  borderColor: AppColors.orangeColor,
                  focusBorderColor: AppColors.orangeColor,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
                // Phone Number Field
                BlackText(
                  text: 'Mobile Number',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFieldWidget(
                  controller: controller.phoneNumberController,
                  hintText: 'Enter mobile number',
                  fillColor: AppColors.whiteColor,
                  borderColor: AppColors.orangeColor,
                  focusBorderColor: AppColors.orangeColor,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
                // Email Field
                BlackText(
                  text: 'Email',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFieldWidget(
                  controller: controller.emailController,
                  hintText: 'Enter email address',
                  fillColor: AppColors.whiteColor,
                  borderColor: AppColors.orangeColor,
                  focusBorderColor: AppColors.orangeColor,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter email address';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
                // Gender Selector
                BlackText(
                  text: 'Gender',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.01),
                Obx(
                  () => GenderSelector(
                    selectedGender: controller.selectedGender.value,
                    onGenderSelected: (gender) {
                      controller.setGender(gender);
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Save Button
                OrangeButton(
                  onTap: () {
                    controller.saveProfile();
                  },
                  text: 'Save Profile',
                  height: screenHeight * 0.06,
                  borderRadius: 15,
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

