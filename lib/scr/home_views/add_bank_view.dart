import 'package:fingodriver/scr/components/components/common_widgets/app_drawer.dart';
import 'package:fingodriver/scr/components/components/common_widgets/custom-appbar_2nd.dart';
import 'package:fingodriver/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';

class AddBankView extends StatelessWidget {
  const AddBankView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: CustomAppBar(title: "ADD BANK"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.03),
                // Bank Name Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackText(
                      text: "Bank Name",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.greyText,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFieldWidget(
                      controller: homeController.bankNameController,
                      hintText: "",
                      fillColor: Colors.white,
                      borderColor: AppColors.orangeColor,
                      focusBorderColor: AppColors.orangeColor,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // Branch Name Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackText(
                      text: "Branch Name",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.greyText,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFieldWidget(
                      controller: homeController.branchNameController,
                      hintText: "",
                      fillColor: Colors.white,
                      borderColor: AppColors.orangeColor,
                      focusBorderColor: AppColors.orangeColor,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // Holder Name Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackText(
                      text: "Holder Name",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.greyText,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFieldWidget(
                      controller: homeController.holderNameController,
                      hintText: "",
                      fillColor: Colors.white,
                      borderColor: AppColors.orangeColor,
                      focusBorderColor: AppColors.orangeColor,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // Account Number Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackText(
                      text: "Account Number",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.greyText,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFieldWidget(
                      controller: homeController.accountNumberController,
                      hintText: "",
                      keyboardType: TextInputType.number,
                      fillColor: Colors.white,
                      borderColor: AppColors.orangeColor,
                      focusBorderColor: AppColors.orangeColor,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // Other Information Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackText(
                      text: "Other Information",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.greyText,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextFieldWidget(
                      controller: homeController.otherInfoController,
                      hintText: "",
                      maxLine: 3,
                      fillColor: Colors.white,
                      borderColor: AppColors.orangeColor,
                      focusBorderColor: AppColors.orangeColor,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*.12),
                // Add Bank Button
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                  child: OrangeButton(
                    onTap: () {
                      // Handle add bank action
                      homeController.addBank();
                    },
                    text: "Add Bank",
                    color: AppColors.orangeColor,
                    textColor: AppColors.whiteColor,
                    height: screenHeight * 0.06,
                    borderRadius: 10,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
