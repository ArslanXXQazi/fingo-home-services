import 'dart:io';
import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:image_picker/image_picker.dart';

class UserServiceDetailsView extends StatelessWidget {
  const UserServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    AuthController authController = Get.find<AuthController>();
    HomeController homeController = Get.find<HomeController>();

    Widget uploadTile(String label, String key, Rxn<XFile> rxFile) {
      return Expanded(
        child: GestureDetector(
          onTap: (){ authController.pickImage(key); },
          child: Container(
            height: screenHeight*.11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
              color: const Color(0XFF6B6B6B38).withOpacity(.12),
            ),
            child: Obx((){
              final file = rxFile.value;
              if (file != null) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(File(file.path), fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.upload, width: screenWidth*.08),
                  SizedBox(height: screenHeight*.008),
                  BlackText(
                    text: label,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.greyText,
                  ),
                ],
              );
            }),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.orangeColor,
        body: Center(
          child: Container(
            height: screenHeight*.9,
            width: screenWidth*.9,
            padding: EdgeInsets.symmetric(horizontal: screenWidth*.03),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth*.06)
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight*.025),
                  Obx(() => Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            if (authController.userServiceStep.value == 2) {
                              authController.backToUserStep();
                            } else { Get.back(); }
                          },
                          child: SvgPicture.asset(AppImages.arrowBack,width: screenWidth*.03,)),
                      const Spacer(),
                      BlackText(
                        text: authController.userServiceStep.value == 1 ? "User Details (1/2)" : "Service Details (2/2)",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        textColor: AppColors.greyText,
                      ),
                      const Spacer(),
                    ],
                  )),

                  Obx(() => authController.userServiceStep.value == 1
                      ? Form(
                          key: authController.userDetailsFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight*.02),
                              BlackText(text: "Your Name", fontSize: 12, fontWeight: FontWeight.w400),
                              SizedBox(height: screenHeight*.008),
                              TextFieldWidget(
                                controller: authController.userNameController,
                                hintText: "Enter your name",
                                validator: authController.validateRequired,
                              ),

                              SizedBox(height: screenHeight*.015),
                              BlackText(text: "Email Address", fontSize: 12, fontWeight: FontWeight.w400),
                              SizedBox(height: screenHeight*.008),
                              TextFieldWidget(
                                controller: authController.userEmailController,
                                hintText: "Enter your email",
                                keyboardType: TextInputType.emailAddress,
                                validator: authController.validateEmail,
                              ),

                              SizedBox(height: screenHeight*.015),
                              BlackText(text: "Phone Number", fontSize: 12, fontWeight: FontWeight.w400),
                              SizedBox(height: screenHeight*.008),
                              TextFieldWidget(
                                controller: authController.userPhoneController,
                                hintText: "Enter your phone number",
                                keyboardType: TextInputType.phone,
                                validator: authController.validatePhone,
                              ),

                              SizedBox(height: screenHeight*.015),
                              BlackText(text: "Address", fontSize: 12, fontWeight: FontWeight.w400),
                              SizedBox(height: screenHeight*.008),
                              TextFieldWidget(
                                controller: authController.userAddressController,
                                hintText: "Enter your address",
                                validator: authController.validateRequired,
                              ),

                              SizedBox(height: screenHeight*.015),
                              BlackText(text: "National Identity Card Number", fontSize: 12, fontWeight: FontWeight.w400),
                              SizedBox(height: screenHeight*.008),
                              TextFieldWidget(
                                controller: authController.userCnicController,
                                hintText: "Enter your DNI/NIE",
                                validator: authController.validateRequired,
                              ),

                              SizedBox(height: screenHeight*.015),
                              BlackText(text: "Identity Card Photo", fontSize: 12, fontWeight: FontWeight.w400),
                              SizedBox(height: screenHeight*.008),
                              Row(
                                children: [
                                  uploadTile("Upload front photo", 'cnicFront', authController.userCnicFront),
                                  SizedBox(width: screenWidth*.03),
                                  uploadTile("Upload back photo", 'cnicBack', authController.userCnicBack),
                                ],
                              ),

                              SizedBox(height: screenHeight*.025),
                              OrangeButton(
                                  onTap: (){
                                    // Allow navigation even if form is empty
                                    authController.goToServiceStep();
                                  },
                                  text: "Next"
                              ),
                              SizedBox(height: screenHeight*.02),
                            ],
                          ),
                        )
                      : Form(
                          key: authController.userServiceDetailsFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight*.015),
                              BlackText(text: "Select Service", fontSize: 15, fontWeight: FontWeight.w700,),
                              SizedBox(height: screenHeight*.02),
                              // Services Grid
                              Obx(() {
                                final services = homeController.getAllServices();
                                final selectedService = homeController.selectedService.value;
                                
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: screenWidth * 0.025,
                                    mainAxisSpacing: screenHeight * 0.005,
                                    childAspectRatio: 0.95,
                                  ),
                                  itemCount: services.length,
                                  itemBuilder: (context, index) {
                                    final serviceEntry = services.entries.elementAt(index);
                                    final serviceKey = serviceEntry.key;
                                    final serviceName = serviceEntry.value;
                                    final iconPath = homeController.getServiceIcon(serviceKey);
                                    final isSelected = selectedService == serviceKey;
                                    
                                    return GestureDetector(
                                      onTap: () {
                                        homeController.setService(serviceKey);
                                        Get.toNamed(AppRoutes.subCategorySelectionView);
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: screenWidth * 0.16,
                                            height: screenWidth * 0.16,
                                            decoration: BoxDecoration(
                                              color: isSelected 
                                                  ? AppColors.orangeColor.withOpacity(0.2) 
                                                  : AppColors.orangeColor.withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              border: isSelected 
                                                  ? Border.all(
                                                      color: AppColors.orangeColor,
                                                      width: 2,
                                                    )
                                                  : null,
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                iconPath,
                                                width: screenWidth * 0.08,
                                                height: screenWidth * 0.08,
                                                color: AppColors.orangeColor,
                                                errorBuilder: (context, _, __) => Icon(
                                                  Icons.cleaning_services,
                                                  color: AppColors.orangeColor,
                                                  size: screenWidth * 0.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          BlackText(
                                            text: serviceName,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            textColor: isSelected ? AppColors.orangeColor : AppColors.greyColor,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }),

                              SizedBox(height: screenHeight*.02),
                              BlackText(text: "Experience", fontSize: 15, fontWeight: FontWeight.w700,),
                              SizedBox(height: screenHeight*.01),
                              BlackText(text: "How long have you been working in this service?", fontSize: 12, fontWeight: FontWeight.w400, textColor: AppColors.greyText,),
                              SizedBox(height: screenHeight*.015),
                              // Experience Years and Months Selector
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BlackText(text: "Years", fontSize: 12, fontWeight: FontWeight.w500,),
                                        SizedBox(height: screenHeight*.008),
                                        Obx(() => Container(
                                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.015),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              color: authController.selectedExperienceYears.value != '0' 
                                                  ? AppColors.orangeColor.withOpacity(0.3) 
                                                  : Colors.grey.withOpacity(0.2),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              value: authController.selectedExperienceYears.value,
                                              icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.greyText, size: screenWidth * 0.05),
                                              style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              dropdownColor: Colors.white,
                                              menuMaxHeight: screenHeight * 0.4,
                                              borderRadius: BorderRadius.circular(12),
                                              elevation: 8,
                                              items: List.generate(21, (index) => index.toString())
                                                  .map((year) => DropdownMenuItem(
                                                    value: year,
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth * 0.02, 
                                                        vertical: screenHeight * 0.01,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(6),
                                                      ),
                                                      child: BlackText(
                                                        text: year == '0' ? '0' : '$year ${year == '1' ? 'year' : 'years'}',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                        textColor: AppColors.blackColor,
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ),
                                                  ))
                                                  .toList(),
                                              selectedItemBuilder: (BuildContext context) {
                                                return List.generate(21, (index) => index.toString())
                                                    .map((year) => Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: BlackText(
                                                        text: year == '0' ? '0' : '$year ${year == '1' ? 'year' : 'years'}',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                        textColor: AppColors.blackColor,
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ))
                                                    .toList();
                                              },
                                              onChanged: (value) {
                                                if (value != null) {
                                                  authController.selectedExperienceYears.value = value;
                                                }
                                              },
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BlackText(text: "Months", fontSize: 12, fontWeight: FontWeight.w500,),
                                        SizedBox(height: screenHeight*.008),
                                        Obx(() => Container(
                                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.015),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              color: authController.selectedExperienceMonths.value != '0' 
                                                  ? AppColors.orangeColor.withOpacity(0.3) 
                                                  : Colors.grey.withOpacity(0.2),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              value: authController.selectedExperienceMonths.value,
                                              icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.greyText, size: screenWidth * 0.05),
                                              style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              dropdownColor: Colors.white,
                                              menuMaxHeight: screenHeight * 0.3,
                                              borderRadius: BorderRadius.circular(12),
                                              elevation: 8,
                                              items: List.generate(12, (index) => index.toString())
                                                  .map((month) => DropdownMenuItem(
                                                    value: month,
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth * 0.02, 
                                                        vertical: screenHeight * 0.01,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(6),
                                                      ),
                                                      child: BlackText(
                                                        text: month == '0' ? '0' : '$month ${month == '1' ? 'month' : 'months'}',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                        textColor: AppColors.blackColor,
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ),
                                                  ))
                                                  .toList(),
                                              selectedItemBuilder: (BuildContext context) {
                                                return List.generate(12, (index) => index.toString())
                                                    .map((month) => Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: BlackText(
                                                        text: month == '0' ? '0' : '$month ${month == '1' ? 'month' : 'months'}',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                        textColor: AppColors.blackColor,
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ))
                                                    .toList();
                                              },
                                              onChanged: (value) {
                                                if (value != null) {
                                                  authController.selectedExperienceMonths.value = value;
                                                }
                                              },
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight*.01),
                              // Display Selected Experience
                              Obx(() {
                                final years = authController.selectedExperienceYears.value;
                                final months = authController.selectedExperienceMonths.value;
                                String experienceText = '';
                                
                                if (years != '0' && months != '0') {
                                  experienceText = '${years == '1' ? '1 year' : '$years years'} ${months == '1' ? '1 month' : '$months months'}';
                                } else if (years != '0') {
                                  experienceText = years == '1' ? '1 year' : '$years years';
                                } else if (months != '0') {
                                  experienceText = months == '1' ? '1 month' : '$months months';
                                } else {
                                  experienceText = 'No experience';
                                }
                                
                                if (years == '0' && months == '0') {
                                  return Padding(
                                    padding: EdgeInsets.only(top: screenHeight * 0.005),
                                    child: BlackText(
                                      text: 'Please select your experience',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      textColor: Colors.red,
                                    ),
                                  );
                                }
                                
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.012),
                                  decoration: BoxDecoration(
                                    color: AppColors.orangeColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.work_outline, color: AppColors.orangeColor, size: screenWidth * 0.05),
                                      SizedBox(width: screenWidth * 0.02),
                                      Expanded(
                                        child: BlackText(
                                          text: 'Experience: $experienceText',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          textColor: AppColors.orangeColor,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),

                              SizedBox(height: screenHeight*.03),
                              Row(
                                children: [
                                  Expanded(
                                    child: OrangeButton(
                                        onTap: (){ authController.backToUserStep(); },
                                        text: "Back"
                                    ),
                                  ),
                                  SizedBox(width: screenWidth*.03),
                                  Expanded(
                                    child: OrangeButton(
                                        onTap: (){
                                          if (homeController.selectedService.value.isEmpty) {
                                            Get.snackbar('Error', 'Please select a service');
                                            return;
                                          }
                                          if (homeController.selectedSubCategory.value.isEmpty) {
                                            Get.snackbar('Error', 'Please select a sub-category');
                                            return;
                                          }
                                          if (authController.selectedExperienceYears.value == '0' && authController.selectedExperienceMonths.value == '0') {
                                            Get.snackbar('Error', 'Please select your experience');
                                            return;
                                          }
                                          final form = authController.userServiceDetailsFormKey.currentState;
                                          if (form != null && form.validate()) {
                                            Get.snackbar('Success', 'Details submitted');
                                            Get.toNamed(AppRoutes.bottomNavView);
                                          }
                                        },
                                        text: "Submit"
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight*.02),
                            ],
                          ),
                        )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

