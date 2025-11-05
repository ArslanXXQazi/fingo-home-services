import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingodriver/scr/components/components/common_widgets/document_card.dart';

class DocumentView extends StatelessWidget {
  const DocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final EditProfileController controller = Get.put(EditProfileController());

    Widget section(Widget child) => Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.035,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );

    return Scaffold(
      appBar: const CustomAppBar(title: "DOCUMENTS"),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              // National ID (CNIC/Passport/License)
              section(Obx(() => DocumentCard(
                label: "National ID / CNIC / Passport",
                isUploaded: controller.hasDocumentUploaded('nationalId'),
                status: controller.getStatusRx('nationalId').value,
                file: controller.getDocumentFile('nationalId'),
                onTap: () => controller.pickDocumentImage('nationalId'),
              ))),

              SizedBox(height: screenHeight * 0.02),
              // Address Proof
              section(Obx(() => DocumentCard(
                label: "Address Proof (Utility Bill / Bank Statement)",
                isUploaded: controller.hasDocumentUploaded('addressProof'),
                status: controller.getStatusRx('addressProof').value,
                file: controller.getDocumentFile('addressProof'),
                onTap: () => controller.pickDocumentImage('addressProof'),
              ))),

              SizedBox(height: screenHeight * 0.02),
              // Police Clearance
              section(Obx(() => DocumentCard(
                label: "Police Clearance Certificate",
                isUploaded: controller.hasDocumentUploaded('policeClearance'),
                status: controller.getStatusRx('policeClearance').value,
                file: controller.getDocumentFile('policeClearance'),
                onTap: () => controller.pickDocumentImage('policeClearance'),
              ))),

              SizedBox(height: screenHeight * 0.02),
              // Professional Certificate
              section(Obx(() => DocumentCard(
                label: "Professional / Training Certificate",
                isUploaded: controller.hasDocumentUploaded('professionalCertificate'),
                status: controller.getStatusRx('professionalCertificate').value,
                file: controller.getDocumentFile('professionalCertificate'),
                onTap: () => controller.pickDocumentImage('professionalCertificate'),
              ))),

              SizedBox(height: screenHeight * 0.03),
              OrangeButton(
                onTap: controller.submitDocuments,
                text: 'Submit',
                height: screenHeight * 0.06,
                borderRadius: 15,
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}


