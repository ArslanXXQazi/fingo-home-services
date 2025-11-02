import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/home_views/home_controller/home_controller.dart';

class SwipeToStartButton extends StatelessWidget {
  final VoidCallback? onSwipeCallback;
  
  const SwipeToStartButton({
    super.key,
    this.onSwipeCallback,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Get HomeController instance
    final HomeController homeController = Get.find<HomeController>();
    
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxDragDistance = constraints.maxWidth - (screenHeight * 0.08);
        
        return Obx(() => Container(
            width: screenWidth,
            height: screenHeight * 0.08,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            decoration: BoxDecoration(
            color: homeController.isRideStarted.value 
                ? AppColors.orangeColor 
                : AppColors.orangeColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Background text
                Center(
                  child: AnimatedOpacity(
                    opacity: homeController.isRideStarted.value ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: BlackText(
                      text: "Swipe to Start Ride",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.whiteColor,
                    ),
                  ),
                ),
                
                // Success text
                Center(
                  child: AnimatedOpacity(
                    opacity: homeController.isRideStarted.value ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.whiteColor,
                          size: screenWidth * 0.06,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        BlackText(
                          text: "Ride Started!",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Draggable button
                Positioned(
                  left: homeController.swipePosition.value,
                  top: 4,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (!homeController.isRideStarted.value) {
                        homeController.updateSwipePosition(
                          (homeController.swipePosition.value + details.delta.dx)
                              .clamp(0.0, maxDragDistance)
                        );
                      }
                    },
                    onPanEnd: (details) {
                      if (!homeController.isRideStarted.value) {
                        if (homeController.swipePosition.value > maxDragDistance * 0.8) {
                          // Complete the swipe
                          homeController.completeSwipe();
                          // Call callback after animation
                          Future.delayed(Duration(milliseconds: 500), () {
                            onSwipeCallback?.call();
                          });
                        } else {
                          // Reset position
                          homeController.resetSwipe();
                        }
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: screenHeight * 0.08 - 8,
                      height: screenHeight * 0.08 - 8,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        homeController.isRideStarted.value ? Icons.check : Icons.arrow_forward_ios,
                        color: AppColors.orangeColor,
                        size: screenWidth * 0.06,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
      );
  }
}
