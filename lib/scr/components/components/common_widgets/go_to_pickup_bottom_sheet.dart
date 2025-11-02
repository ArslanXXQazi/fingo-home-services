import 'package:fingodriver/scr/components/components/constant/linker.dart';

class GoToPickupBottomSheet extends StatelessWidget {
  final VoidCallback? onPickupReached;
  
  const GoToPickupBottomSheet({
    super.key,
    this.onPickupReached,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return SafeArea(
      child: Container(
        height: screenHeight * 0.45,
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
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Driver Info Section
                    Row(
                      children: [
                        // Profile Image
                        Container(
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            color: AppColors.orangeColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            color: AppColors.whiteColor,
                            size: screenWidth * 0.075,
                          ),
                        ),

                        SizedBox(width: screenWidth * 0.04),

                        // Driver Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlackText(
                                text: "Mato Fahad",
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.blackColor,
                              ),
                              SizedBox(height: screenHeight * 0.006),
                              Row(
                                children: [
                                  ...List.generate(5, (index) => Padding(
                                    padding: EdgeInsets.only(right: screenWidth * 0.008),
                                    child: Icon(
                                      Icons.star,
                                      color: AppColors.yellowColor,
                                      size: screenWidth * 0.03,
                                    ),
                                  )),
                                  SizedBox(width: screenWidth * 0.012),
                                  BlackText(
                                    text: "4.9",
                                    fontSize: 12,
                                    textColor: AppColors.greyText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Contact Icons
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
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Route Stepper (Simple version like in image)
                    Row(
                      children: [
                        // Time estimate
                        Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.01),
                          child: BlackText(
                            text: "5\nmin",
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.greyText,
                          ),
                        ),

                        // Dotted Line Column
                        Column(
                          children: [
                            // Start Point
                            Container(
                              width: screenWidth * 0.03,
                              height: screenWidth * 0.03,
                              decoration: BoxDecoration(
                                color: AppColors.blackColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            // Dotted Line
                            Container(
                              width: screenWidth * 0.005,
                              height: screenHeight * 0.06,
                              child: CustomPaint(
                                painter: DottedLinePainter(),
                              ),
                            ),
                            // End Point
                            Container(
                              width: screenWidth * 0.03,
                              height: screenWidth * 0.03,
                              decoration: BoxDecoration(
                                color: AppColors.orangeColor,
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: screenWidth * 0.04),

                        // Route Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Start Location
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BlackText(
                                          text: "My location",
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.greyText,
                                        ),
                                        BlackText(
                                          text: "1.2 km",
                                          fontSize: screenWidth * 0.03,
                                          textColor: AppColors.greyText,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: AppColors.orangeColor.withOpacity(.4),height: screenHeight*.03,),
                              // End Location
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BlackText(
                                          text: "zzzz******* India",
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.greyText,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.03),
                    
                    // Action Buttons
                    Row(children: [
                      Expanded(child: OrangeButton(
                        onTap: (){
                          print("Pickup button tapped");
                          // Call the callback to show ride start bottom sheet
                          onPickupReached?.call();
                          // Close current bottom sheet
                          Navigator.of(context).pop();
                        }, 
                        text:"Go to Pickup"
                      )),
                      SizedBox(width: screenWidth * 0.05),
                      Expanded(child: OrangeButton(
                          onTap: (){
                            Get.back();
                          },
                          text:"Cancel",
                          color: Colors.white,
                          textColor: AppColors.orangeColor,
                          borderColor: AppColors.orangeColor,
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

// Custom Painter for Dotted Line
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.orangeColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashHeight = 4.0;
    const dashSpace = 4.0;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
