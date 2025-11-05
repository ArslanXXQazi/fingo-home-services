import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

Future<void> showPaymentReceivedDialog({
  required BuildContext context,
}) async {
  await Get.dialog(
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
                  color: AppColors.orangeColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.orangeColor,
                  size: MediaQuery.of(context).size.width * 0.08,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Title
              BlackText(
                text: 'Payment Received',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              // Message
              BlackText(
                text: 'You have received the payment',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              // OK Button
              OrangeButton( onTap: () => Get.back(), text: "OK")
            ],
          ),
        ),
      ),
    ),
    barrierColor: Colors.black.withOpacity(0.5),
    barrierDismissible: true,
  );
}

