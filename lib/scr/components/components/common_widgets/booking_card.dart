import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/bottom_nav_bar_views/booking_view/booking_model.dart';
import 'package:fingodriver/scr/components/components/common_widgets/accept_reject_dialog.dart';
import 'package:fingodriver/scr/bottom_nav_bar_views/booking_view/booking_controller.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;
  final BookingController? controller;

  const BookingCard({
    super.key,
    required this.booking,
    this.onAccept,
    this.onReject,
    this.controller,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'accepted':
        return Colors.blue;
      case 'confirmed':
        return Colors.green;
      case 'in-progress':
        return Colors.purple;
      case 'completed':
        return AppColors.greenColor;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final statusColor = _getStatusColor(booking.status);

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Status Badge and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status Badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.005,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.1),
                  border: Border.all(color: statusColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (booking.status.toLowerCase() == 'accepted')
                      Icon(
                        Icons.check,
                        color: statusColor,
                        size: screenWidth * 0.035,
                      )
                    else
                      Container(
                        width: screenWidth * 0.02,
                        height: screenWidth * 0.02,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    SizedBox(width: screenWidth * 0.02),
                    BlackText(
                      text: booking.status.toUpperCase(),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      textColor: statusColor,
                    ),
                  ],
                ),
              ),
              // Time Indicator / Navigate Button (for accepted status)
              if (booking.status.toLowerCase() == 'accepted')
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate functionality
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.navigation,
                              color: Colors.white,
                              size: screenWidth * 0.04,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            BlackText(
                              text: 'Navigate',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    BlackText(
                      text: booking.timeAgo,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.greyText,
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: screenWidth * 0.09,
                        height: screenWidth * 0.09,
                        decoration: BoxDecoration(
                          color: AppColors.blueColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.flag_sharp,
                          color: AppColors.blueColor,
                          size: screenWidth * 0.06,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    BlackText(
                      text: booking.timeAgo,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.greyText,
                    ),
                  ],
                ),
            ],
          ),

          SizedBox(height: screenHeight * 0.02),

          // Service Title with Icon
          Row(
            children: [
              Container(
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                decoration: BoxDecoration(
                  color: AppColors.blueColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.build,
                  color: AppColors.blueColor,
                  size: screenWidth * 0.06,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: BlackText(
                  text: booking.serviceTitle,
                  fontSize: 16,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.blackColor,
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          // Location
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: AppColors.greyText,
                size: screenWidth * 0.04,
              ),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: BlackText(
                  text: booking.address,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.greyText,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.02),

          // Customer Name
          Row(
            children: [
              Container(
                width: screenWidth * 0.08,
                height: screenWidth * 0.08,
                decoration: BoxDecoration(
                  color: AppColors.blueColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.blueColor,
                  size: screenWidth * 0.04,
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              BlackText(
                text: booking.customerName,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: AppColors.blackColor,
              ),
            ],
          ),

          // Payment Details (for accepted and other statuses)
          if (booking.status.toLowerCase() != 'pending') ...[
            SizedBox(height: screenHeight * 0.015),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.012,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Credit Card Icon and Payment Text
                  Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: AppColors.greyColor, // Dark grey
                        size: screenWidth * 0.045,
                      ),
                      SizedBox(width: screenWidth * 0.025),
                      BlackText(
                        text: 'Payment: ${booking.paymentMethod.toLowerCase()}',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.greyColor, // Dark grey
                      ),
                    ],
                  ),
                  // Right side: Orange Badge with Three Dots
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.006,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.orangeColor.withOpacity(.2), // Solid orange
                      borderRadius: BorderRadius.circular(20), // Oval shape
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Three white dots stacked vertically
                        BlackText(
                          text: booking.paymentStatus,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.orangeColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Action Buttons for pending status
          if (booking.status.toLowerCase() == 'pending') ...[
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: Obx(() {
                    final isLoading = controller != null &&
                        controller!.isAccepting(booking.id);

                    return GestureDetector(
                      onTap: isLoading
                          ? null
                          : () {
                              showAcceptRejectDialog(
                                context: context,
                                isAccept: true,
                                onConfirm: () {
                                  onAccept?.call();
                                },
                              );
                            },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                        decoration: BoxDecoration(
                          color: isLoading
                              ? AppColors.greenColor.withOpacity(0.6)
                              : AppColors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greenColor.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: isLoading
                              ? SizedBox(
                                  width: screenWidth * 0.05,
                                  height: screenWidth * 0.05,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : BlackText(
                                  text: 'Accept',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.white,
                                ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showAcceptRejectDialog(
                        context: context,
                        isAccept: false,
                        onConfirm: () {
                          onReject?.call();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.redColor.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: BlackText(
                          text: 'Reject',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],

          // Arrival at Destination / Mark as Completed Button (for accepted status)
          if (booking.status.toLowerCase() == 'accepted') ...[
            SizedBox(height: screenHeight * 0.02),
            Obx(() {
              final isLoading = controller != null &&
                  controller!.isArrivingAtDestination(booking.id);
              final hasArrived = controller != null &&
                  controller!.hasArrived(booking.id);

              return GestureDetector(
                onTap: isLoading
                    ? null
                    : () {
                        if (hasArrived) {
                          // Mark as completed
                          controller?.markAsCompleted(booking.id);
                        } else {
                          // Arrival at destination
                          controller?.arrivalAtDestination(booking.id);
                        }
                      },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                  decoration: BoxDecoration(
                    color: isLoading || hasArrived
                        ? AppColors.greenColor
                        : AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: (isLoading || hasArrived
                                ? AppColors.greenColor
                                : AppColors.orangeColor)
                            .withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            ),
                          )
                        : BlackText(
                            text: hasArrived
                                ? 'Mark as Completed'
                                : 'Arrival at Destination',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: Colors.white,
                          ),
                  ),
                ),
              );
            }),
          ],

          // Completed Status - Green Button (for completed status)
          if (booking.status.toLowerCase() == 'completed') ...[
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greenColor.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: BlackText(
                  text: 'Completed',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

