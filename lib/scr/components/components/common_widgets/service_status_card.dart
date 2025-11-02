import 'package:fingodriver/scr/components/components/constant/linker.dart';

class ServiceStatusCard extends StatelessWidget {
  const ServiceStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<HomeController>(
      builder: (c) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Top Section: Service Status with Icon and Toggle
              Row(
                children: [
                  // Left Icon
                  Container(
                    width: screenWidth * 0.12,
                    height: screenWidth * 0.12,
                    decoration: BoxDecoration(
                      color: AppColors.greenColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: ImageIcon(AssetImage(AppImages.serviceStatus),size: screenWidth*.07,color: AppColors.greenColor)),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  // Middle: Service Status Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlackText(
                          text: "Service Status",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.blackColor,
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        BlackText(
                          text: "Available",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.greenColor,
                        ),
                      ],
                    ),
                  ),
                  // Right: Toggle Switch
                  Switch(
                    value: c.isServiceEnabled.value,
                    onChanged: (value) {
                      c.toggleServiceStatus();
                    },
                    activeColor: AppColors.whiteColor,
                    activeTrackColor: AppColors.orangeColor,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.grey.shade200,
                  ),
                ],
              ),
              
              SizedBox(height: screenHeight * 0.02),
              
              // Divider
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              
              SizedBox(height: screenHeight * 0.02),
              
              // Bottom Section: Time Details
              // Start Time
              _buildTimeRow(
                context: context,
                icon: Icons.play_arrow,
                iconColor: AppColors.greenColor,
                label: "Start Time",
                value: c.startTime.value,
                isStatus: false,
              ),
              
              SizedBox(height: screenHeight * 0.015),
              
              // End Time
              _buildTimeRow(
                context: context,
                icon: Icons.stop,
                iconColor: AppColors.redColor,
                label: "End Time",
                value: c.endTime.value,
                isStatus: false,
              ),
              
              SizedBox(height: screenHeight * 0.015),
              
              // Current Status
              _buildTimeRow(
                context: context,
                icon: Icons.check_circle,
                iconColor: AppColors.greenColor,
                label: "Current Status",
                value: c.currentStatus.value,
                isStatus: true,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimeRow({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required bool isStatus,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        // Icon
        Container(
          width: screenWidth * 0.06,
          height: screenWidth * 0.06,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: screenWidth * 0.035,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        // Label
        Expanded(
          child: BlackText(
            text: label,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textColor: AppColors.blackColor,
            textAlign: TextAlign.left,
          ),
        ),
        // Value
        BlackText(
          text: value,
          fontSize: 14,
          fontWeight: isStatus ? FontWeight.w600 : FontWeight.w500,
          textColor: isStatus ? AppColors.greenColor : AppColors.blackColor,
        ),
      ],
    );
  }
}

