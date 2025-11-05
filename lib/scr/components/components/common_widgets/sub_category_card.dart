import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class SubCategoryCard extends StatelessWidget {
  final String subCategoryName;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const SubCategoryCard({
    super.key,
    required this.subCategoryName,
    required this.iconPath,
    required this.isSelected,
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
          color: isSelected ? AppColors.orangeColor.withOpacity(0.1) : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.orangeColor : Colors.grey.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.015),
            // Icon Container
            Container(
              width: screenWidth * 0.14,
              height: screenWidth * 0.14,
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.orangeColor.withOpacity(0.15) 
                    : AppColors.orangeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.asset(
                  iconPath,
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            // Sub-Category Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: BlackText(
                text: subCategoryName,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                textColor: isSelected ? AppColors.orangeColor : AppColors.blackColor,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
          ],
        ),
      ),
    );
  }
}

