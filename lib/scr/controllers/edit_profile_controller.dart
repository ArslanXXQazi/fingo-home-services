import 'package:fingohomeservices/scr/components/components/constant/linker.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  
  final RxString selectedGender = 'male'.obs;

  // Documents (home services)
  final Rxn<XFile> nationalIdFile = Rxn<XFile>();
  final Rxn<XFile> addressProofFile = Rxn<XFile>();
  final Rxn<XFile> policeClearanceFile = Rxn<XFile>();
  final Rxn<XFile> professionalCertificateFile = Rxn<XFile>();

  final RxString nationalIdStatus = 'pending'.obs; // pending | approved | rejected
  final RxString addressProofStatus = 'pending'.obs;
  final RxString policeClearanceStatus = 'pending'.obs;
  final RxString professionalCertificateStatus = 'pending'.obs;

  late final AuthController authController;
  
  @override
  void onInit() {
    super.onInit();
    authController = Get.find<AuthController>();
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

  // ---------- Documents Helpers ----------
  bool hasDocumentUploaded(String key) {
    switch (key) {
      case 'nationalId':
        return nationalIdFile.value != null;
      case 'addressProof':
        return addressProofFile.value != null;
      case 'policeClearance':
        return policeClearanceFile.value != null;
      case 'professionalCertificate':
        return professionalCertificateFile.value != null;
      default:
        return false;
    }
  }

  XFile? getDocumentFile(String key) {
    switch (key) {
      case 'nationalId':
        return nationalIdFile.value;
      case 'addressProof':
        return addressProofFile.value;
      case 'policeClearance':
        return policeClearanceFile.value;
      case 'professionalCertificate':
        return professionalCertificateFile.value;
      default:
        return null;
    }
  }

  RxString getStatusRx(String key) {
    switch (key) {
      case 'nationalId':
        return nationalIdStatus;
      case 'addressProof':
        return addressProofStatus;
      case 'policeClearance':
        return policeClearanceStatus;
      case 'professionalCertificate':
        return professionalCertificateStatus;
      default:
        return ''.obs;
    }
  }

  Future<void> pickDocumentImage(String key) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        switch (key) {
          case 'nationalId':
            nationalIdFile.value = image;
            nationalIdStatus.value = 'pending';
            break;
          case 'addressProof':
            addressProofFile.value = image;
            addressProofStatus.value = 'pending';
            break;
          case 'policeClearance':
            policeClearanceFile.value = image;
            policeClearanceStatus.value = 'pending';
            break;
          case 'professionalCertificate':
            professionalCertificateFile.value = image;
            professionalCertificateStatus.value = 'pending';
            break;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void submitDocuments() {
    if (!hasDocumentUploaded('nationalId') ||
        !hasDocumentUploaded('addressProof') ||
        !hasDocumentUploaded('policeClearance')) {
      Get.snackbar('Missing Documents', 'Please upload required documents');
      return;
    }
    Get.snackbar('Submitted', 'Documents submitted for review');
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

