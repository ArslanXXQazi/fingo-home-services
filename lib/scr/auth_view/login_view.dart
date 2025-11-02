import 'package:fingodriver/scr/components/components/constant/linker.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                key: authController.signInFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight*.03),
                    Center(
                      child: BlackText(
                        text: "Log in",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.orangeColor,
                      ),
                    ),
                    SizedBox(height: screenHeight*.03),
                    BlackText(
                      text: "Email",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: screenHeight*.01),
                    TextFieldWidget(
                      controller: authController.emailController,
                      hintText: "abc@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                      validator: authController.validateEmail,
                    ),
                    SizedBox(height: screenHeight*.02),
                    BlackText(
                      text: "Password",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: screenHeight*.01),
                    TextFieldWidget(
                      controller: authController.passwordController,
                      hintText: "********",
                      isPassword: true,
                      validator: authController.validatePassword,
                    ),
                    SizedBox(height: screenHeight*.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: BlackText(
                        text: "Forgot Password?",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.greyColor,
                        onTap: (){ },
                      ),
                    ),
                    SizedBox(height: screenHeight*.02),
                    OrangeButton(onTap: (){
                      final form = authController.signInFormKey.currentState;
                      if (form != null && form.validate()) {
                        Get.snackbar('Success', 'Logged in successfully');
                        Get.toNamed(AppRoutes.homeView);
                      }
                    }, text: "Log in"),
                    SizedBox(height: screenHeight*.02),
                    OrangeButton(
                      onTap: (){
                        Get.offNamed(AppRoutes.phoneNumberView);
                      },
                      text: " Sign up with phone number",
                      image: AppImages.phone,
                      color: AppColors.transparentColor,
                      borderColor: AppColors.orangeColor,
                      textColor: AppColors.orangeColor,
                    ),
                    SizedBox(height: screenHeight*.02),
                    Center(child: BlackText(text: "OR",textColor: AppColors.greyColor,)),
                    SizedBox(height: screenHeight*.02),
                    SocialLoginsButtons(),
                    SizedBox(height: screenHeight*.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlackText(
                          text: "Don’t have an account?",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        BlackText(
                          onTap: (){
                           Get.offNamed(AppRoutes.signUpView);
                          },
                          text: " Sign Up",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.orangeColor,
                        ),
                      ],),
                    SizedBox(height: screenHeight*.03),


                  ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


