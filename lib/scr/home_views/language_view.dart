

import 'package:fingodriver/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.put(HomeController());

    Widget languageTile({required String code, required String label, required String image}) {
      return Obx((){
        final bool isSelected = homeController.selectedLanguage.value == code;
        return InkWell(
          onTap: () => homeController.setLanguage(code),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: screenWidth*.035, vertical: screenHeight*.016),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: isSelected ? AppColors.orangeColor : AppColors.orangeColor.withOpacity(.2)),
            ),
            child: Row(
              children: [
                Image.asset(image, width: screenWidth*.08),
                SizedBox(width: screenWidth*.03),
                BlackText(
                  text: label,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.blackColor,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        );
      });
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'LANGUAGE'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth*.06, vertical: screenHeight*.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight*.02),
              BlackText(
                text: 'Punlicinfo',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: screenHeight*.01),
              languageTile(code: 'en', label: 'English', image: AppImages.eng),
              SizedBox(height: screenHeight*.03),
              languageTile(code: 'ar', label: 'Arabic', image: AppImages.arabic),

              SizedBox(height: screenHeight*.12),
              OrangeButton(
                onTap: (){ Get.back(); },
                text: 'Save',
                height: screenHeight*.06,
                borderRadius: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


