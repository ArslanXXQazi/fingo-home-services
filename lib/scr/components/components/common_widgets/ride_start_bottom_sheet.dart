import 'package:fingodriver/scr/components/components/constant/linker.dart';

class RideStartBottomSheet extends StatelessWidget {
  const RideStartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      height: screenHeight * 0.41,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
            // Handle bar
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.015),
              width: screenWidth * 0.1,
              height: screenHeight * 0.005,
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.005),
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    // Swipe to Start Ride Button
                    SwipeToStartButton(
                      onSwipeCallback: () {
                        print("Swipe to start ride completed");
                        // Update state to ride in progress
                        Get.find<HomeController>().setRideInProgressState();
                        // Close current bottom sheet
                        Navigator.of(context).pop();
                      },
                    ),
                    
                    SizedBox(height: screenHeight * 0.03),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Container(
                        width: screenWidth * 0.11,
                        height: screenWidth * 0.11,
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.email,
                            width: screenWidth * 0.07,
                            height: screenWidth * 0.07,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      // Contact icon
                      Container(
                        width: screenWidth * 0.11,
                        height: screenWidth * 0.11,
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.contactUs,
                            width: screenWidth * 0.07,
                            height: screenWidth * 0.07,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],),

                    // Pick up section
                    BlackText(
                      text: "Pick up",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.orangeColor,
                    ),

                    // Pickup address
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.04,
                          height: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        BlackText(
                          text: "zzzz******** India",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.greyText,
                        ),
                      ],
                    ),
                    
                    SizedBox(height: screenHeight * 0.02),
                    
                    // Cancel button
                   OrangeButton(
                       onTap: (){},
                       text: "Cancel",
                       color: Colors.white,
                       borderColor: AppColors.orangeColor,
                       textColor: AppColors.orangeColor,
                   )
                  ],
                ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
