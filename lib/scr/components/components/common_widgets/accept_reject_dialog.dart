import 'package:fingodriver/scr/components/components/constant/linker.dart';

void showAcceptRejectDialog({
  required BuildContext context,
  required bool isAccept,
  required VoidCallback onConfirm,
}) {
  Get.dialog(
    Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success Icon
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  color: isAccept
                      ? AppColors.greenColor.withOpacity(0.1)
                      : AppColors.redColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isAccept ? Icons.check_circle : Icons.cancel,
                  color: isAccept ? AppColors.greenColor : AppColors.redColor,
                  size: MediaQuery.of(context).size.width * 0.08,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Title
              BlackText(
                text: isAccept ? 'Accept Booking' : 'Reject Booking',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              // Message
              BlackText(
                text: isAccept
                    ? 'Are you sure you want to accept this booking request?'
                    : 'Are you sure you want to reject this booking request?',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              // Action Buttons
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.015,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: BlackText(
                            text: 'Cancel',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),

                  // Accept/Reject Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                        onConfirm();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.015,
                        ),
                        decoration: BoxDecoration(
                          color: isAccept
                              ? AppColors.greenColor
                              : AppColors.redColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: (isAccept
                                      ? AppColors.greenColor
                                      : AppColors.redColor)
                                  .withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isAccept ? Icons.check : Icons.close,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width * 0.04,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02),
                            BlackText(
                              text: isAccept ? 'Accept' : 'Reject',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    barrierColor: Colors.black.withOpacity(0.5),
    barrierDismissible: true,
  );
}

