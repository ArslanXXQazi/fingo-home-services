import 'package:fingodriver/scr/components/components/constant/linker.dart';

class HomeController extends GetxController {


  final RxString city = ''.obs;
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString carModel = ''.obs;
  final RxString carPlate = ''.obs;
  final RxString address = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxString contactEmailOrPhone = ''.obs;
  final RxString selectedLanguage = 'en'.obs;
  final RxString paymentMethod = 'Cash on Delivery'.obs;
  
  // Service Status variables
  final RxBool isServiceEnabled = true.obs;
  final RxString startTime = '12:00 AM'.obs;
  final RxString endTime = '11:55 PM'.obs;
  final RxString currentStatus = 'Within Hours'.obs;
  
  // Performance Stats variables
  final RxString averageRating = '0.0/5'.obs;
  final RxString jobsCompleted = '0'.obs;
  final RxString onTimeArrival = '0.0%'.obs;
  final RxString repeatCustomers = '0'.obs;
  
  // Bank form controllers
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController otherInfoController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print("HomeController initialized");
  }

  //===========>>> Language
  void setLanguage(String code) {
    selectedLanguage.value = code;
    update();
  }

  //===========>>> Add Bank
  void addBank() {
    // Validate form fields
    if (bankNameController.text.isEmpty) {
      Get.snackbar("Error", "Please enter bank name");
      return;
    }
    if (branchNameController.text.isEmpty) {
      Get.snackbar("Error", "Please enter branch name");
      return;
    }
    if (holderNameController.text.isEmpty) {
      Get.snackbar("Error", "Please enter holder name");
      return;
    }
    if (accountNumberController.text.isEmpty) {
      Get.snackbar("Error", "Please enter account number");
      return;
    }

    // Here you would typically save the bank details to your backend
    print("Bank Name: ${bankNameController.text}");
    print("Branch Name: ${branchNameController.text}");
    print("Holder Name: ${holderNameController.text}");
    print("Account Number: ${accountNumberController.text}");
    print("Other Info: ${otherInfoController.text}");

    // Show success message
    Get.snackbar("Success", "Bank details added successfully");

    // Navigate back to withdraw method screen
    Get.back();

    // Clear form fields
    clearBankForm();
  }

  //===========>>> Clear Bank Form
  void clearBankForm() {
    bankNameController.clear();
    branchNameController.clear();
    holderNameController.clear();
    accountNumberController.clear();
    otherInfoController.clear();
  }

  //===========>>> Toggle Service Status
  void toggleServiceStatus() {
    isServiceEnabled.value = !isServiceEnabled.value;
    update();
  }

  @override
  void onClose() {
    // Dispose controllers when the controller is disposed
    bankNameController.dispose();
    branchNameController.dispose();
    holderNameController.dispose();
    accountNumberController.dispose();
    otherInfoController.dispose();
    super.onClose();
  }

}