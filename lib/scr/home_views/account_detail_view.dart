

import 'package:fingohomeservices/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final HomeController homeController = Get.put(HomeController());

    final TextEditingController firstNameController = TextEditingController(text: homeController.firstName.value);
    final TextEditingController lastNameController = TextEditingController(text: homeController.lastName.value);
    final TextEditingController carModelController = TextEditingController(text: homeController.lastName.value);
    final TextEditingController carPlateController = TextEditingController(text: homeController.lastName.value);
    final TextEditingController emailController = TextEditingController(text: homeController.contactEmailOrPhone.value);
    final TextEditingController phoneController = TextEditingController(text: homeController.phoneNumber.value);

    return Scaffold(
      appBar: const CustomAppBar(title: 'ACCOUNT DETAILS'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth*.06, vertical: screenHeight*.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight*.03),
              BlackText(
                text: 'Punlicinfo',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: screenHeight*.01),
              TextFieldWidget(
                controller: firstNameController,
                hintText: 'First Name',
                fillColor: AppColors.whiteColor,
                borderColor: AppColors.orangeColor,
                focusBorderColor: AppColors.orangeColor,
                onChanged: (v){ homeController.firstName.value = v; },
              ),
              SizedBox(height: screenHeight*.012),
              TextFieldWidget(
                controller: lastNameController,
                hintText: 'Last Name',
                fillColor: AppColors.whiteColor,
                borderColor: AppColors.orangeColor,
                focusBorderColor: AppColors.orangeColor,
                onChanged: (v){ homeController.lastName.value = v; },
              ),
              SizedBox(height: screenHeight*.012),
              TextFieldWidget(
                controller: carModelController,
                hintText: 'Car Model',
                fillColor: AppColors.whiteColor,
                borderColor: AppColors.orangeColor,
                focusBorderColor: AppColors.orangeColor,
                onChanged: (v){ homeController.carModel.value = v; },
              ),
              SizedBox(height: screenHeight*.012),
              TextFieldWidget(
                controller: carPlateController,
                hintText: 'Car Plate',
                fillColor: AppColors.whiteColor,
                borderColor: AppColors.orangeColor,
                focusBorderColor: AppColors.orangeColor,
                onChanged: (v){ homeController.carPlate.value = v; },
              ),
              SizedBox(height: screenHeight*.02),
              BlackText(
                text: 'PRIVATE DETAILS',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: screenHeight*.02),
              TextFieldWidget(
                controller: emailController,
                hintText: 'Email Address',
                fillColor: AppColors.whiteColor,
                borderColor: AppColors.orangeColor,
                focusBorderColor: AppColors.orangeColor,
                keyboardType: TextInputType.emailAddress,
                onChanged: (v){ homeController.contactEmailOrPhone.value = v; },
              ),
              SizedBox(height: screenHeight*.012),
              TextFieldWidget(
                controller: phoneController,
                hintText: 'Phone Number',
                fillColor: AppColors.whiteColor,
                borderColor: AppColors.orangeColor,
                focusBorderColor: AppColors.orangeColor,
                keyboardType: TextInputType.phone,
                onChanged: (v){ homeController.phoneNumber.value = v; },
              ),
              SizedBox(height: screenHeight*.07),
              OrangeButton(
                onTap: (){ Get.back(); },
                text: 'Save',
                height: screenHeight*.06,
                borderRadius: 15,
              ),
              SizedBox(height: screenHeight*.02),
            ],
          ),
        ),
      ),
    );
  }
}


