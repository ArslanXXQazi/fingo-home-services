import 'package:fingodriver/scr/components/components/constant/linker.dart';

class ServiceCard extends StatelessWidget {
  final String serviceKey;
  final String serviceName;
  final String iconPath;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.serviceKey,
    required this.serviceName,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.02),
            // Icon Container
            Container(
              width: screenWidth * 0.18,
              height: screenWidth * 0.18,
              decoration: BoxDecoration(
                color: AppColors.orangeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  iconPath,
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            // Service Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: BlackText(
                text: serviceName,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                textColor: AppColors.blackColor,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}

