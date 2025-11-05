


import 'package:fingodriver/scr/components/components/constant/linker.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final _f1 = FocusNode();
  final _f2 = FocusNode();
  final _f3 = FocusNode();
  final _f4 = FocusNode();
  final _f5 = FocusNode();
  final _f6 = FocusNode();

  @override
  void dispose() {
    _f1.dispose();
    _f2.dispose();
    _f3.dispose();
    _f4.dispose();
    _f5.dispose();
    _f6.dispose();
    super.dispose();
  }

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
              child: Column(
                children: [
                  SizedBox(height: screenHeight*.03),
                  Row(children: [
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
                  Form(
                    key: authController.otpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        // Title
                        BlackText(
                          text: "OTP Verification",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.greyText,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: screenHeight*.02),

                        // Instructions
                        BlackText(
                          text: "Enter the code from the sms we sent\nto +8801*******",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.greyText,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: screenHeight*.02),

                        // Timer
                        Obx(() => BlackText(
                          text: authController.formattedTimer,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.orangeColor,
                          textAlign: TextAlign.center,
                        )),

                        SizedBox(height: screenHeight*.03),

                        // OTP Input Fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpFieldWidget(
                              controller: authController.otpController1,
                              focusNode: _f1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              onNext: () => FocusScope.of(context).requestFocus(_f2),
                            ),
                            OtpFieldWidget(
                              controller: authController.otpController2,
                              focusNode: _f2,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              onNext: () => FocusScope.of(context).requestFocus(_f3),
                              onPrevious: () => FocusScope.of(context).requestFocus(_f1),
                            ),
                            OtpFieldWidget(
                              controller: authController.otpController3,
                              focusNode: _f3,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              onNext: () => FocusScope.of(context).requestFocus(_f4),
                              onPrevious: () => FocusScope.of(context).requestFocus(_f2),
                            ),
                            OtpFieldWidget(
                              controller: authController.otpController4,
                              focusNode: _f4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              onNext: () => FocusScope.of(context).requestFocus(_f5),
                              onPrevious: () => FocusScope.of(context).requestFocus(_f3),
                            ),
                            OtpFieldWidget(
                              controller: authController.otpController5,
                              focusNode: _f5,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              onNext: () => FocusScope.of(context).requestFocus(_f6),
                              onPrevious: () => FocusScope.of(context).requestFocus(_f4),
                            ),
                            OtpFieldWidget(
                              controller: authController.otpController6,
                              focusNode: _f6,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              onPrevious: () => FocusScope.of(context).requestFocus(_f5),
                            ),
                          ],
                        ),

                        SizedBox(height: screenHeight*.03),

                        // Resend Option
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlackText(
                              text: "Don't receive the OTP? ",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: AppColors.blackColor,
                            ),
                            BlackText(
                              text: authController.canResend.value ? "RESEND" : "RESEND",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: authController.canResend.value ? AppColors.orangeColor : AppColors.greyColor,
                              onTap: authController.canResend.value ? authController.resendOTP : null,
                            ),
                          ],
                        )),

                        SizedBox(height: screenHeight*.03),

                        // Submit Button
                        OrangeButton(
                            onTap: (){
                              final form = authController.otpFormKey.currentState;
                              if (form != null && form.validate()) {
                                // Check if all OTP fields are filled
                                String otp = authController.otpController1.text +
                                    authController.otpController2.text +
                                    authController.otpController3.text +
                                    authController.otpController4.text +
                                    authController.otpController5.text +
                                    authController.otpController6.text;

                                if (otp.length == 6) {
                                  Get.snackbar('Success', 'OTP verified successfully');
                                  Get.toNamed(AppRoutes.userServiceDetailsView);
                                } else {
                                  Get.snackbar('Error', 'Please enter complete OTP');
                                }
                              }
                            },
                            text: "Submit"
                        ),

                        SizedBox(height: screenHeight*.03),
                      ],
                    ),
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
