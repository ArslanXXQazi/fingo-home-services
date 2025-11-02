import 'package:fingodriver/scr/components/components/constant/linker.dart';

class CustomerFeedbackCard extends StatelessWidget {
  final String customerName;
  final int rating; // 1-5
  final String reviewText;
  final String timeAgo;

  const CustomerFeedbackCard({
    super.key,
    required this.customerName,
    required this.rating,
    required this.reviewText,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Picture
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
          // Customer Info and Review
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Customer Name
                BlackText(
                  text: customerName,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.blackColor,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.006),
                // Star Rating
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: index < rating ? Colors.amber : Colors.grey,
                      size: screenWidth * 0.04,
                    );
                  }),
                ),
                SizedBox(height: screenHeight * 0.006),
                // Review Text
                BlackText(
                  text: reviewText,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.blackColor,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.006),
                // Timestamp
                BlackText(
                  text: timeAgo,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.blue,
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

