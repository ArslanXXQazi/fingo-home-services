import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class EditServiceDialog extends StatefulWidget {
  final String serviceName;
  final String subCategory;
  final String initialPrice;
  final Function(String price) onSave;

  const EditServiceDialog({
    Key? key,
    required this.serviceName,
    required this.subCategory,
    required this.initialPrice,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditServiceDialog> createState() => _EditServiceDialogState();
}

class _EditServiceDialogState extends State<EditServiceDialog> {
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    priceController = TextEditingController(text: widget.initialPrice);
  }

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.all(screenWidth * 0.06),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlackText(
                  text: 'Edit Service',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.blackColor,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.backGroundGrey,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColors.greyColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),

            // Service Name (Display Only)
            BlackText(
              text: 'Service Name',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              textColor: AppColors.greyText,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              decoration: BoxDecoration(
                color: AppColors.backGroundGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: BlackText(
                text: widget.serviceName,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Category (Display Only)
            BlackText(
              text: 'Category',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              textColor: AppColors.greyText,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              decoration: BoxDecoration(
                color: AppColors.backGroundGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: BlackText(
                text: widget.subCategory,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Price Field
            BlackText(
              text: 'Price',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              textColor: AppColors.blackColor,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: screenHeight * 0.01),
            TextFieldWidget(
              controller: priceController,
              hintText: 'Enter price',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textColor: AppColors.blackColor,
              hintColor: AppColors.greyText,
              borderColor: AppColors.greyColor.withOpacity(0.3),
              focusBorderColor: AppColors.orangeColor,
              fillColor: AppColors.backGroundGrey,
            ),
            SizedBox(height: screenHeight * 0.03),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        color: AppColors.backGroundGrey,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.greyColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: BlackText(
                          text: 'Cancel',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: OrangeButton(
                    onTap: () {
                      if (priceController.text.trim().isEmpty) {
                        Get.snackbar('Error', 'Please enter price');
                        return;
                      }
                      widget.onSave(priceController.text.trim());
                      Get.back();
                    },
                    text: 'Save',
                    height: screenHeight * 0.06,
                    borderRadius: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

