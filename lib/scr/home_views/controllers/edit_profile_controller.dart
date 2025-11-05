import 'package:fingodriver/scr/components/components/constant/linker.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  
  final RxString selectedGender = 'male'.obs;
  
  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }
  
  void _loadUserData() {
    final HomeController homeController = Get.find<HomeController>();
    
    // Load existing user data
    firstNameController.text = homeController.firstName.value;
    lastNameController.text = homeController.lastName.value;
    phoneNumberController.text = homeController.phoneNumber.value;
    emailController.text = homeController.contactEmailOrPhone.value;
    
    // Set gender if available (you can add gender field to HomeController later)
    // selectedGender.value = homeController.gender.value;
  }
  
  void setGender(String gender) {
    selectedGender.value = gender;
  }
  
  void saveProfile() {
    if (formKey.currentState!.validate()) {
      final HomeController homeController = Get.find<HomeController>();
      
      // Update HomeController with new values
      homeController.firstName.value = firstNameController.text.trim();
      homeController.lastName.value = lastNameController.text.trim();
      homeController.phoneNumber.value = phoneNumberController.text.trim();
      homeController.contactEmailOrPhone.value = emailController.text.trim();
      // homeController.gender.value = selectedGender.value;
      
      // Show success message
      Get.snackbar(
        "Success",
        "Profile updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.greenColor,
        colorText: AppColors.whiteColor,
      );
      
      // Navigate back
      Get.back();
    }
  }
  
  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.onClose();
  }
}

