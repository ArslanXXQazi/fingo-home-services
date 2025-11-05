


import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

import '../components/components/common_widgets/custom_app_bar.dart';

class ContactUsView extends StatelessWidget {
  ContactUsView({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.all(screenWidth*.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: (){},
              child: CircleAvatar(
                radius: screenWidth*.07,
                backgroundColor: AppColors.orangeColor,
                child: Image.asset(AppImages.contactUs,width: screenWidth*.07,),
              ),
            )
          ],),
      ),
      appBar: CustomAppBar(title: "CONTACT US"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth*.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight*.03),
              BlackText(
                text: "Our Address",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              SizedBox(height: screenHeight*.02),
              BlackText(
                text: "Ahmedabad - 380013, INDIA",
                fontWeight: FontWeight.w400,
                fontSize: 13,
                textColor: AppColors.greyText,
              ),
              SizedBox(height: screenHeight*.02),
              BlackText(
                text: "Email Us",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              SizedBox(height: screenHeight*.02),
              TextFieldWidget(
                controller: emailController,
                hintText: "info@abc.com",
                fillColor: Colors.white,
                borderColor: AppColors.orangeColor,
                suffixIcon: Icon(Icons.arrow_forward_ios,color: AppColors.greyText,size: screenWidth*.05,),
              )



            ],),
        ),
      ),
    );
  }
}
