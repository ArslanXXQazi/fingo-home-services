import 'dart:io';
import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
                                    final form = authController.userDetailsFormKey.currentState;
                                    if (form != null && form.validate()) {
                                      authController.goToServiceStep();
                                    }
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
                              SizedBox(height: screenHeight*.01),
                              Obx((){
                                final services = homeController.getAllServices();
                                final value = homeController.selectedService.value.isNotEmpty 
                                    ? homeController.selectedService.value 
                                    : null;
                                return DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  value: value,
                                  validator: (v)=> v==null || v.isEmpty ? 'Please select a service' : null,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                    filled: true,
                                    fillColor: const Color(0XFF6B6B6B38).withOpacity(.18),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                                  ),
                                  hint: const Text('Select service'),
                                  items: services.entries.map((entry) => 
                                    DropdownMenuItem(value: entry.key, child: Text(entry.value))
                                  ).toList(),
                                  onChanged: (v){
                                    if (v != null) {
                                      homeController.setService(v);
                                    }
                                  },
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    maxHeight: screenHeight * .35,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 44,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                                  ),
                                );
                              }),

                              SizedBox(height: screenHeight*.015),
                              Obx((){
                                // Get sub-categories based on selected service
                                final subCategories = homeController.getSubCategoriesForService(homeController.selectedService.value);
                                if (homeController.selectedService.value.isEmpty) return const SizedBox.shrink();
                                
                                final subCategoryValue = homeController.selectedSubCategory.value.isEmpty ? null : homeController.selectedSubCategory.value;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BlackText(text: "Select Sub-Category", fontSize: 12, fontWeight: FontWeight.w400),
                                    SizedBox(height: screenHeight*.008),
                                    DropdownButtonFormField2<String>(
                                      isExpanded: true,
                                      value: subCategoryValue,
                                      validator: (v)=> v==null || v.isEmpty ? 'Please select a sub-category' : null,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                        filled: true,
                                        fillColor: const Color(0XFF6B6B6B38).withOpacity(.18),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                                      ),
                                      hint: const Text('Select sub-category'),
                                      items: subCategories.map((e)=> DropdownMenuItem(value: e, child: Text(e))).toList(),
                                      onChanged: (v){ 
                                        if (v != null) {
                                          homeController.setSubCategory(v);
                                        }
                                      },
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        maxHeight: screenHeight * .35,
                                      ),
                                      menuItemStyleData: const MenuItemStyleData(height: 44),
                                      iconStyleData: const IconStyleData(icon: Icon(Icons.keyboard_arrow_down_rounded)),
                                    ),
                                  ],
                                );
                              }),

                              SizedBox(height: screenHeight*.025),
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

