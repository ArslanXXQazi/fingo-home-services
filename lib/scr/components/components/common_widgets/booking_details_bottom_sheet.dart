import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/bottom_nav_bar_views/booking_view/booking_model.dart';

class BookingDetailsBottomSheet extends StatelessWidget {
  final BookingModel booking;

  const BookingDetailsBottomSheet({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.03,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Title and Close Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlackText(
                  text: 'Booking Details',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.blackColor,
                  textAlign: TextAlign.left,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: AppColors.blackColor,
                    size: screenWidth * 0.06,
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.025),

            // Booking Status
            _buildDetailRow(
              context: context,
              label: 'Booking Status:',
              value: booking.status.toUpperCase(),
              isBoldValue: true,
            ),

            SizedBox(height: screenHeight * 0.02),

            // Service
            _buildDetailRow(
              context: context,
              label: 'Service:',
              value: booking.serviceTitle,
              isBoldValue: true,
            ),

            SizedBox(height: screenHeight * 0.02),

            // Customer Details
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.orange,
                    size: screenWidth * 0.06,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlackText(
                        text: 'Customer',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.blackColor,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      BlackText(
                        text: booking.customerName,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        textColor: AppColors.blackColor,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: screenHeight * 0.003),
                      BlackText(
                        text: '+923069676003', // Dummy phone number
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.blackColor,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.02),

            // Address Details
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.orangeColor,
                  size: screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlackText(
                        text: 'Address',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.blackColor,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      BlackText(
                        text: 'Home', // Dummy address type
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        textColor: AppColors.blackColor,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: screenHeight * 0.003),
                      BlackText(
                        text: booking.address,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.blackColor,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.02),

            // Schedule Date
            _buildDetailRow(
              context: context,
              label: 'Schedule Date:',
              value: '2025-11-02', // Dummy date
              isBoldValue: true,
            ),

            SizedBox(height: screenHeight * 0.02),

            // Schedule Time
            _buildDetailRow(
              context: context,
              label: 'Schedule Time:',
              value: '18:20-20:20', // Dummy time
              isBoldValue: true,
            ),

            SizedBox(height: screenHeight * 0.02),

            // Payment Method
            _buildDetailRow(
              context: context,
              label: 'Payment Method:',
              value: booking.paymentMethod.toLowerCase(),
              isBoldValue: true,
            ),

            SizedBox(height: screenHeight * 0.02),

            // Total Amount
            _buildDetailRow(
              context: context,
              label: 'Total Amount:',
              value: '₹300.00', // Dummy amount
              isBoldValue: true,
            ),

            SizedBox(height: screenHeight * 0.03),

            // Open Map Button
            OrangeButton(
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(AppRoutes.mapView, arguments: booking);
                },
                text: "Open Map",
                image: AppImages.mapIcon,
                borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required BuildContext context,
    required String label,
    required String value,
    bool isBoldValue = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BlackText(
            text: label,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            textColor: AppColors.blackColor,
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: BlackText(
            text: value,
            fontSize: 13,
            fontWeight: isBoldValue ? FontWeight.w700 : FontWeight.w400,
            textColor: AppColors.blackColor,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

Future<void> showBookingDetailsBottomSheet({
  required BuildContext context,
  required BookingModel booking,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparentColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.04),
        topRight: Radius.circular(MediaQuery.of(context).size.width * 0.04),
      ),
    ),
    builder: (ctx) {
      final screenWidth = MediaQuery.of(ctx).size.width;
      return Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.04),
            topRight: Radius.circular(screenWidth * 0.04),
          ),
        ),
        child: BookingDetailsBottomSheet(booking: booking),
      );
    },
  );
}

