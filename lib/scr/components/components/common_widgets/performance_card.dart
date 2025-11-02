import 'package:fingodriver/scr/components/components/constant/linker.dart';

class PerformanceCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? labelColor;
  final Color? iconColor;

  const PerformanceCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    this.onTap,
    this.labelColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BlackText(
                  text: value,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.blackColor,
                ),
                const Spacer(),
                CircleAvatar(
                  radius: screenWidth * 0.035,
                  backgroundColor: AppColors.backGroundGrey,
                  child: Icon(
                    icon,
                    size: screenWidth * 0.05,
                    color: iconColor ?? AppColors.orangeColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            BlackText(
              text: label,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
              textColor: labelColor ?? AppColors.orangeColor,
            ),
          ],
        ),
      ),
    );
  }
}

