import 'package:fingodriver/scr/components/components/constant/linker.dart';

class BankTransferCard extends StatelessWidget {
  final String title;
  final String status;
  final String actionText;
  final VoidCallback? onActionTap;
  final String? iconPath;

  const BankTransferCard({
    super.key,
    required this.title,
    required this.status,
    required this.actionText,
    this.onActionTap,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      padding: EdgeInsets.symmetric(vertical: screenHeight*.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.orangeColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           // Bank Transfer Title Row
           Padding(
             padding: EdgeInsets.symmetric(horizontal: screenWidth*.04),
             child: Row(
               children: [
                 Image.asset(
                   iconPath ?? AppImages.bank,
                   width: screenWidth * 0.06,
                   height: screenWidth * 0.06,
                   color: AppColors.blackColor,
                 ),
                 SizedBox(width: screenWidth * 0.03),
                 // Bank Transfer Text
                 BlackText(
                   text: title,
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   textColor: Colors.black,
                 ),
               ],
             ),
           ),
           // Center Divider
           Container(
             margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
             height: 1,
             color: AppColors.orangeColor.withOpacity(.3),
           ),
           // Status and Action Row
           Padding(
             padding: EdgeInsets.symmetric(horizontal: screenWidth*.04),
             child: Row(
               children: [
                 // Status Text
                 BlackText(
                   text: status,
                   fontSize: 14,
                   fontWeight: FontWeight.w400,
                   textColor: AppColors.orangeColor,
                 ),
                 SizedBox(width: screenWidth * 0.02),
                 // Setup Now Action
                 GestureDetector(
                   onTap: onActionTap,
                   child: BlackText(
                     text: actionText,
                     fontSize: 14,
                     fontWeight: FontWeight.w500,
                     textColor: Colors.blue,
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
    );
  }
}
