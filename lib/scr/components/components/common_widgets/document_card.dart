import 'dart:io';
import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:image_picker/image_picker.dart';

class DocumentCard extends StatelessWidget {
  final String label;
  final bool isUploaded;
  final String? status; // 'pending', 'approved', 'rejected'
  final XFile? file;
  final VoidCallback onTap;

  const DocumentCard({
    super.key,
    required this.label,
    required this.isUploaded,
    this.status,
    this.file,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlackText(
          text: label,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          textColor: AppColors.greyText,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: screenHeight * 0.01),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: screenHeight * 0.08,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: isUploaded && file != null
                ? Row(
                    children: [
                      Container(
                        width: screenWidth * 0.2,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.file(
                            File(file!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlackText(
                              text: status == 'pending'
                                  ? 'Waiting For Approval'
                                  : status == 'approved'
                                      ? 'Approved'
                                      : 'Rejected',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              textColor: status == 'pending'
                                  ? AppColors.orangeColor
                                  : status == 'approved'
                                      ? AppColors.greenColor
                                      : AppColors.redColor,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: AppColors.orangeColor,
                        size: screenWidth * 0.06,
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.upload,
                          width: screenWidth * 0.12,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}


