import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderSelected;

  const GenderSelector({
    Key? key,
    required this.selectedGender,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onGenderSelected('male'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
              decoration: BoxDecoration(
                color: selectedGender == 'male'
                    ? AppColors.orangeColor.withOpacity(0.1)
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedGender == 'male'
                      ? AppColors.orangeColor
                      : AppColors.greyColor.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.male,
                    color: selectedGender == 'male'
                        ? AppColors.orangeColor
                        : AppColors.greyText,
                    size: screenWidth * 0.06,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  BlackText(
                    text: 'Male',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: selectedGender == 'male'
                        ? AppColors.orangeColor
                        : AppColors.greyText,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: GestureDetector(
            onTap: () => onGenderSelected('female'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
              decoration: BoxDecoration(
                color: selectedGender == 'female'
                    ? AppColors.orangeColor.withOpacity(0.1)
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedGender == 'female'
                      ? AppColors.orangeColor
                      : AppColors.greyColor.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.female,
                    color: selectedGender == 'female'
                        ? AppColors.orangeColor
                        : AppColors.greyText,
                    size: screenWidth * 0.06,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  BlackText(
                    text: 'Female',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: selectedGender == 'female'
                        ? AppColors.orangeColor
                        : AppColors.greyText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

