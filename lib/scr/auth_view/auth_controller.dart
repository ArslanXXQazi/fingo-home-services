

import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController1 = TextEditingController();
  final otpController2 = TextEditingController();
  final otpController3 = TextEditingController();
  final otpController4 = TextEditingController();
  final otpController5 = TextEditingController();
  final otpController6 = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();

  var selectMethod = ''.obs;
  var isChecked = false.obs;
  var isPasswordVisible = false.obs;
  var timerSeconds = 139.obs; // 2:19 in seconds
  var canResend = false.obs;

  // User Details (for Home Services)
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPhoneController = TextEditingController();
  final userAddressController = TextEditingController();
  final userCnicController = TextEditingController();
  final userDetailsFormKey = GlobalKey<FormState>();
  final userServiceDetailsFormKey = GlobalKey<FormState>();
  var userServiceStep = 1.obs; // 1 = User Details, 2 = Service Selection
  final Rxn<XFile> userCnicFront = Rxn<XFile>();
  final Rxn<XFile> userCnicBack = Rxn<XFile>();

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timerSeconds.value = 139; // 2:19 in seconds
    canResend.value = false;

    // Timer countdown
    Future.doWhile(() async {
      await Future.delayed(Duration(seconds: 1));
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
        return true;
      } else {
        canResend.value = true;
        return false;
      }
    });
  }

  String get formattedTimer {
    int minutes = timerSeconds.value ~/ 60;
    int seconds = timerSeconds.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void resendOTP() {
    if (canResend.value) {
      startTimer();
      Get.snackbar('Success', 'OTP sent successfully');
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }


  String ? validateName (String? value){

    if (value == null || value.isEmpty){
      return "Name cannot be empty";
    }
    return null;

  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (value.length < 10) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  //===========>>> User Service Step Navigation
  void goToServiceStep() {
    userServiceStep.value = 2;
  }

  void backToUserStep() {
    userServiceStep.value = 1;
  }

  //===========>>> Image Picker for User
  Future<void> pickImage(String key) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      
      if (image != null) {
        switch (key) {
          case 'cnicFront':
            userCnicFront.value = image;
            break;
          case 'cnicBack':
            userCnicBack.value = image;
            break;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    otpController5.dispose();
    otpController6.dispose();
    userNameController.dispose();
    userEmailController.dispose();
    userPhoneController.dispose();
    userAddressController.dispose();
    userCnicController.dispose();
    super.onClose();
  }
}