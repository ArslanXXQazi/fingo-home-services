import 'package:fingodriver/scr/components/components/constant/linker.dart';

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String subCategory;
  final String iconPath;

  const ServiceCard({
    Key? key,
    required this.serviceName,
    required this.subCategory,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Service Icon
          Container(
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
            decoration: BoxDecoration(
              color: AppColors.orangeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  AppColors.orangeColor,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  iconPath,
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  errorBuilder: (context, _, __) => Icon(
                    Icons.build,
                    color: AppColors.orangeColor,
                    size: screenWidth * 0.08,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          // Service Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackText(
                  text: serviceName,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.blackColor,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.005),
                BlackText(
                  text: subCategory,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

