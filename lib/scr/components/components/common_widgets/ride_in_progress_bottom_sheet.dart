import 'package:fingodriver/scr/components/components/constant/linker.dart';

class RideInProgressBottomSheet extends StatelessWidget {
  final VoidCallback? onRideEnded;
  
  const RideInProgressBottomSheet({
    super.key,
    this.onRideEnded,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return SafeArea(
      child: Container(
        height: screenHeight * 0.3,
        width: screenWidth,
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
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ride ID Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlackText(
                          text: "Ride XXX-ABC",
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.orangeColor,
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        BlackText(
                          text: "ac****************zz",
                          fontSize: screenWidth * 0.035,
                          textColor: AppColors.greyText,
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Stats Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Time
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.blackColor,
                              size: screenWidth * 0.05,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            BlackText(
                              text: "00:00",
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.greyText,
                            ),
                          ],
                        ),

                        // Distance
                        Row(
                          children: [
                            Icon(
                              Icons.square,
                              color: AppColors.blackColor,
                              size: screenWidth * 0.05,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            BlackText(
                              text: "2.7 km",
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.greyText,
                            ),
                          ],
                        ),

                        // Battery/Range
                        Row(
                          children: [
                            Icon(
                              Icons.battery_charging_full,
                              color: Colors.green,
                              size: screenWidth * 0.05,
                            ),
                            SizedBox(height: screenWidth*.01),
                            BlackText(
                              text: "30.00 km",
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.greyText,
                            ),
                          ],
                        ),
                      ],
                    ),

                    Spacer(),
                    
                    // Action Buttons
                    Row(children: [
                       Expanded(child: OrangeButton(
                         onTap: (){
                           print("Cancel button tapped");
                           // Close all bottom sheets and reset state
                           Navigator.of(context).popUntil((route) => route.isFirst);
                           // Reset to home state
                           Get.find<HomeController>().resetToHomeState();
                           // Reset swipe button state
                           Get.find<HomeController>().resetRideState();
                         }, 
                         text:"Cancel",
                         color: Colors.white,
                         textColor: AppColors.orangeColor,
                         borderColor: AppColors.orangeColor,
                       )),
                      SizedBox(width: screenWidth * 0.05),
                       Expanded(child: OrangeButton(
                           onTap: (){
                             print("End ride button tapped");
                             // Close all bottom sheets and reset state
                             Navigator.of(context).popUntil((route) => route.isFirst);
                             // Reset to home state
                             Get.find<HomeController>().resetToHomeState();
                             // Reset swipe button state
                             Get.find<HomeController>().resetRideState();
                           },
                           text:"End ride",
                       )),

                    ],)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
