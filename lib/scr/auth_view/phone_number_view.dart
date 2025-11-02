import 'package:fingodriver/scr/components/components/constant/linker.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    AuthController authController = Get.find<AuthController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.orangeColor,
        body: Center(
          child: Container(
            height: screenHeight*.85,
            width: screenWith*.9,
            padding: EdgeInsets.symmetric(horizontal: screenWith*.03),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWith*.06)
            ),
            child: SingleChildScrollView(
              child: Form(
                key: authController.phoneFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight*.03),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){Get.back();},
                            child: SvgPicture.asset(AppImages.arrowBack,width: screenWith*.03,)),
                        Spacer(),
                        BlackText(
                          text: "Sign up",
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.orangeColor,
                          fontFamily: 'a',
                        ),
                        Spacer(),

                      ],),
                    SizedBox(height: screenHeight*.03),
                    BlackText(
                      text: "Verify Your Phone Number",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      textColor: AppColors.greyColor,
                    ),
                    SizedBox(height: screenHeight*.02),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: GoogleFonts.geologica(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor,
                        ),
                        children: [
                          TextSpan(text: "We have send you an ",
                              style: GoogleFonts.geologica(
                                  color: AppColors.greyText
                              )),
                          TextSpan(
                            text: "One Time Password (OTP)",
                            style: GoogleFonts.geologica(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                          ),
                          TextSpan(text: "\non this mobile number",
                              style: GoogleFonts.geologica(
                                  color: AppColors.greyText
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight*.03),
                    BlackText(
                      text: "Enter mobile no",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: screenHeight*.01),
                    IntlPhoneField(
                      controller: authController.phoneController,
                      decoration: InputDecoration(
                        hintText: "Enter mobile number",
                        hintStyle: TextStyle(
                          color: AppColors.greyColor,
                        ),
                        filled: true,
                        fillColor: Color(0XFF6B6B6B38).withOpacity(.22),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.transparentColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.transparentColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.orangeColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      initialCountryCode: 'BD',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      validator: (phone) {
                        if (phone == null || phone.number.isEmpty) {
                          return 'Phone number cannot be empty';
                        }
                        if (phone.number.length < 10) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight*.03),
                    OrangeButton(
                        onTap: (){
                          final form = authController.phoneFormKey.currentState;
                          if (form != null && form.validate()) {
                            Get.toNamed(AppRoutes.otpView);
                          }
                        },
                        text: "Get OTP"
                    ),
                    SizedBox(height: screenHeight*.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlackText(
                          text: "Already have an account?",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        BlackText(
                          onTap: (){
                            Get.toNamed(AppRoutes.loginView);
                          },
                          text: " Log in",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.orangeColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
