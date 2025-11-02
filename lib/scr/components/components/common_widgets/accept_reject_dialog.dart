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
                    child: OrangeButton(
                        onTap: () => Get.back(),
                        text: "cancel",
                        color: AppColors.transparentColor,
                       textColor: AppColors.orangeColor,
                       borderColor: AppColors.orangeColor,
                       borderRadius: 10,
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),

                  // Accept/Reject Button
                  Expanded(
                    child: OrangeButton(
                      onTap: () {
                        Get.back();
                        onConfirm();
                      },
                      text: isAccept ? 'Accept' : 'Reject',
                      color: AppColors.orangeColor,
                      textColor: Colors.white,
                      borderRadius: 10,
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

