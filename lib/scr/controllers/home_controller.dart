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

  // User Service Selection
  final RxString selectedService = ''.obs;
  final RxString selectedSubCategory = ''.obs;
  
  // User Services List (stores services added by user)
  final RxList<Map<String, dynamic>> userServices = <Map<String, dynamic>>[].obs;

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

  //===========>>> Set Selected Service
  void setService(String service) {
    selectedService.value = service;
    selectedSubCategory.value = ''; // Reset sub-category when service changes
    update(); // Notify GetBuilder listeners
  }

  //===========>>> Set Selected Sub-Category
  void setSubCategory(String subCategory) {
    selectedSubCategory.value = subCategory;
    update(); // Notify GetBuilder listeners
  }

  //===========>>> Get Sub-Categories for Selected Service
  List<String> getSubCategoriesForService(String service) {
    switch (service) {
      case 'cleaning':
        return [
          'Home deep cleaning',
          'Sofa / Carpet / Curtain cleaning',
          'Bathroom / Kitchen cleaning',
          'Water tank cleaning'
        ];
      case 'electrician':
        return [
          'Fan / light installation',
          'Switchboard repair',
          'Wiring / short circuit fix',
          'Inverter installation'
        ];
      case 'plumber':
        return [
          'Tap / shower installation or repair',
          'Pipe leakage fix',
          'Water purifier fitting',
          'Bathroom fittings installation'
        ];
      case 'appliance':
        return [
          'AC repair / service',
          'Refrigerator, washing machine, microwave repair',
          'TV mounting / repair',
          'Geyser repair & installation'
        ];
      case 'pest_control':
        return [
          'Cockroach control',
          'Termite treatment',
          'Bed bug control',
          'Rodent control'
        ];
      case 'carpenter':
        return [
          'Furniture assembly',
          'Door lock fixing',
          'Custom woodwork',
          'Repair work'
        ];
      case 'painting':
        return [
          'Full home painting',
          'Room-wise painting',
          'Touch-up painting',
          'Waterproofing'
        ];
      case 'salon':
        return [
          'For men & women',
          'Haircut, waxing, facial, manicure/pedicure'
        ];
      case 'fitness':
        return [
          'Personal yoga trainer',
          'Fitness coach',
          'Meditation session booking'
        ];
      case 'packers_movers':
        return [
          'Local shifting',
          'Intercity relocation',
          'Office shifting'
        ];
      case 'tutors':
        return [
          'Subject-wise tutor',
          'Online/offline options',
          'Competitive exam coaching'
        ];
      case 'laundry':
        return [
          'Pick-up and delivery',
          'Dry cleaning',
          'Ironing service'
        ];
      case 'cctv_security':
        return [
          'CCTV setup',
          'Video door phone',
          'Alarm systems'
        ];
      case 'gardening':
        return [
          'Garden maintenance',
          'Landscaping',
          'Plant care services'
        ];
      case 'elderly_care':
        return [
          'Verified caregivers',
          'On-demand / monthly basis',
          'Trained babysitters'
        ];
      default:
        return [];
    }
  }

  //===========>>> Get All Services
  Map<String, String> getAllServices() {
    return {
      'cleaning': 'Cleaning Services',
      'electrician': 'Electrician Services',
      'plumber': 'Plumber Services',
      'appliance': 'Appliance Repair & Installation',
      'pest_control': 'Pest Control',
      'carpenter': 'Carpenter Services',
      'painting': 'Home Painting',
      'salon': 'Salon at Home',
      'fitness': 'Fitness & Yoga Trainer at Home',
      'packers_movers': 'Packers and Movers',
      'tutors': 'Home Tutors',
      'laundry': 'Laundry Services',
      'cctv_security': 'CCTV & Security Installation',
      'gardening': 'Gardening Services',
      'elderly_care': 'Elderly Care / Baby Sitting',
    };
  }

  //===========>>> Get Service Icon
  String getServiceIcon(String serviceKey) {
    switch (serviceKey) {
      case 'cleaning':
        return AppImages.houseCleaning;
      case 'electrician':
        return AppImages.electrician;
      case 'plumber':
        return AppImages.plumber;
      case 'appliance':
        return AppImages.appliance;
      case 'pest_control':
        return AppImages.pestControl;
      case 'carpenter':
        return AppImages.carpenter;
      case 'painting':
        return AppImages.homePainting;
      case 'salon':
        return AppImages.salonServices;
      case 'fitness':
        return AppImages.yoga;
      case 'packers_movers':
        return AppImages.packersMover;
      case 'tutors':
        return AppImages.homeschooling;
      case 'laundry':
        return AppImages.laundryServices;
      case 'cctv_security':
        return AppImages.cctvCamera;
      case 'gardening':
        return AppImages.gardeningServices;
      case 'elderly_care':
        return AppImages.baby;
      default:
        return AppImages.home;
    }
  }

  //===========>>> Get Sub-Category Icon (Random icons for now, will be replaced by API)
  String getSubCategoryIcon(String serviceKey, String subCategory) {
    // For now, return the service icon as sub-category icon
    // Later this will be replaced by API data
    return getServiceIcon(serviceKey);
  }

  //===========>>> Add User Service
  void addUserService(String serviceKey, String serviceName, String subCategory, String experienceYears, String experienceMonths) {
    // Check if service already exists
    bool serviceExists = userServices.any((service) => 
      service['serviceKey'] == serviceKey && service['subCategory'] == subCategory
    );
    
    if (!serviceExists) {
      userServices.add({
        'serviceKey': serviceKey,
        'serviceName': serviceName,
        'subCategory': subCategory,
        'experienceYears': experienceYears,
        'experienceMonths': experienceMonths,
        'isEnabled': true, // Default service is enabled
      });
    }
  }

  //===========>>> Remove User Service
  void removeUserService(int index) {
    if (index >= 0 && index < userServices.length) {
      userServices.removeAt(index);
    }
  }

  //===========>>> Toggle User Service Status (on/off)
  void toggleUserServiceStatus(int index) {
    if (index >= 0 && index < userServices.length) {
      final currentValue = userServices[index]['isEnabled'] as bool? ?? true;
      userServices[index]['isEnabled'] = !currentValue;
      // Force update by assigning a new list reference
      final updatedList = List<Map<String, dynamic>>.from(userServices);
      userServices.assignAll(updatedList);
    }
  }

  //===========>>> Update User Service Price
  void updateUserServicePrice(int index, String price) {
    if (index >= 0 && index < userServices.length) {
      userServices[index]['price'] = price;
      // Force update by assigning a new list reference
      final updatedList = List<Map<String, dynamic>>.from(userServices);
      userServices.assignAll(updatedList);
    }
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