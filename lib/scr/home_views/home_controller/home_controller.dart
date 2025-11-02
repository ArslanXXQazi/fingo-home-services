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
  final RxString paymentMethod = 'Cash on Delivery'.obs; // Default payment method

  // Bank form controllers
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController otherInfoController = TextEditingController();





  // Swipe button related variables
  var isRideStarted = false.obs;
  var swipePosition = 0.0.obs;
  
  // App bar title states
  var currentState = 'home'.obs; // 'home', 'go_to_pickup', 'ride_started', 'ride_in_progress'
  
  @override
  void onInit() {
    super.onInit();
    print("HomeController initialized");
  }
  
  // Swipe button methods
  void updateSwipePosition(double position) {
    swipePosition.value = position;
  }
  
  void completeSwipe() {
    isRideStarted.value = true;
    swipePosition.value = 1000.0; // Set to max value
    print("Swipe completed - Ride started!");
  }
  
  void resetSwipe() {
    swipePosition.value = 0.0;
    print("Swipe reset");
  }
  
  void resetRideState() {
    isRideStarted.value = false;
    swipePosition.value = 0.0;
    print("Ride state reset");
  }
  
  // App bar title methods
  void setGoToPickupState() {
    currentState.value = 'go_to_pickup';
    print("State changed to: Go to Pickup");
  }
  
  void setRideStartedState() {
    currentState.value = 'ride_started';
    print("State changed to: Ride Started");
  }
  
  void setRideInProgressState() {
    currentState.value = 'ride_in_progress';
    print("State changed to: Ride in Progress");
  }
  
  void resetToHomeState() {
    currentState.value = 'home';
    print("State changed to: Home");
  }
  
  String getAppBarTitle() {
    switch (currentState.value) {
      case 'go_to_pickup':
        return "GO TO PICK UP";
      case 'ride_started':
        return "START RIDE";
      case 'ride_in_progress':
        return "RIDE IN PROGRESS";
      default:
        return "Home";
    }
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