

import '../components/components/constant/linker.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppColors.orangeColor,
      body: Center(
        child: Container(
          height: screenHeight*.87,
          width: screenWith*.9,
          padding: EdgeInsets.symmetric(horizontal: screenWith*.03),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenWith*.06)
          ),
          child: SingleChildScrollView(
            child: Form(
              key: authController.signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight*.02),
                  Center(
                    child: BlackText(
                      text: "Sign up",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.orangeColor,
                    ),
                  ),
                  SizedBox(height: screenHeight*.02),
                  BlackText(
                    text: "User Name",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: screenHeight*.01),
                  TextFieldWidget(
                    controller: authController.nameController,
                    hintText: "Abc",
                    validator: authController.validateName,
                  ),
                  SizedBox(height: screenHeight*.02),
                  BlackText(
                    text: "Email",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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
                  ),
                  SizedBox(height: screenHeight*.01),
                  TextFieldWidget(
                    controller: authController.passwordController,
                    hintText: "********",
                    isPassword: true,
                    validator: authController.validatePassword,
                  ),
                  SizedBox(height: screenHeight*.02),
                  BlackText(
                    text: "Confirm password",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: screenHeight*.01),
                  TextFieldWidget(
                    controller: authController.confirmPasswordController,
                    hintText: "********",
                    isPassword: true,
                    validator: authController.validateConfirmPassword,
                  ),
                  SizedBox(height: screenHeight*.02),
                  OrangeButton(onTap: (){
                    final form = authController.signUpFormKey.currentState;
                    if (form != null && form.validate()) {
                      Get.snackbar('Success', 'Form is valid');
                    }
                  }, text: "Sign up"),
                  SizedBox(height: screenHeight*.02),
                  OrangeButton(
                    onTap: (){
                      Get.toNamed(AppRoutes.phoneNumberView);
                    },
                    text: "Sign up with phone number",
                    image: AppImages.phone,
                    color: AppColors.transparentColor,
                    borderColor: AppColors.orangeColor,
                    textColor: AppColors.orangeColor,
                  ),
                  SizedBox(height: screenHeight*.02),
                  Center(child: BlackText(text: "OR",textColor: AppColors.greyColor,)),
                  SizedBox(height: screenHeight*.01),
                  SocialLoginsButtons(),
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
                          Get.offNamed(AppRoutes.loginView);
                        },
                        text: " Log in",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.orangeColor,
                      ),
                    ],),
                  SizedBox(height: screenHeight*.01),


                ],),
            ),
          ),
        ),
      ),
    );
  }
}
