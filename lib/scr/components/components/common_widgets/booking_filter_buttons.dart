import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/controllers/booking_controller.dart';

class BookingFilterButtons extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;
  final BookingController? controller;

  const BookingFilterButtons({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final filters = [
      'all',
      'pending',
      'accepted',
      'confirmed',
      'in-progress',
      'completed',
    ];

    int getCount(String filter) {
      if (controller != null) {
        return controller!.getFilterCount(filter);
      }
      // Default counts if controller not provided
      return {
        'all': 4,
        'pending': 2,
        'accepted': 2,
        'confirmed': 1,
        'in-progress': 1,
        'completed': 0,
      }[filter] ?? 0;
    }

    return Container(
      height: screenHeight * 0.05,
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final label = filters[index];
          final isSelected = selectedFilter == label;
          
          // Use Obx for reactive count updates
          Widget countWidget = Obx(() {
            final count = getCount(label);
            return BlackText(
              text: '$label ($count)',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textColor: isSelected
                  ? AppColors.orangeColor
                  : AppColors.greyText,
            );
          });
          
          // If controller is null, use non-reactive count
          if (controller == null) {
            final count = getCount(label);
            countWidget = BlackText(
              text: '$label ($count)',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textColor: isSelected
                  ? AppColors.orangeColor
                  : AppColors.greyText,
            );
          }

          return GestureDetector(
            onTap: () => onFilterChanged(label),
            child: Container(
              margin: EdgeInsets.only(right: screenWidth * 0.03),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.01,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.orangeColor.withOpacity(0.1)
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? AppColors.orangeColor
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSelected)
                    Icon(
                      Icons.check,
                      color: AppColors.orangeColor,
                      size: screenWidth * 0.04,
                    ),
                  if (isSelected) SizedBox(width: screenWidth * 0.02),
                  countWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

