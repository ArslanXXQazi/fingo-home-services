
import 'package:fingodriver/scr/components/components/constant/linker.dart';

Future<void> showConfirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onOk,
  VoidCallback? onCancel,
  String okText = 'OK',
  String cancelText = 'Cancel',
}) async {
  await Get.dialog(
    Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * .7,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlackText(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 12),
              BlackText(
                text: message,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (onCancel != null) onCancel();
                      Get.back();
                    },
                    child: BlackText(
                      text: cancelText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: Color(0xff28DCFA),
                    ),
                  ),
                  SizedBox(width: 28),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      onOk();
                    },
                    child: BlackText(
                      text: okText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: Color(0xff28DCFA),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    barrierColor: Colors.black.withOpacity(.5),
    barrierDismissible: false,
  );
}


