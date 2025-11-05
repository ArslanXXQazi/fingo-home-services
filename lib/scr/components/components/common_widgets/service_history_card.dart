import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class ServiceHistoryCard extends StatelessWidget {
  final String serviceName;
  final String location;
  final String price;
  final String dateTime;
  final String customerName;

  const ServiceHistoryCard({
    super.key,
    required this.serviceName,
    required this.location,
    required this.price,
    required this.dateTime,
    required this.customerName,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: screenWidth * 0.04),
      padding: EdgeInsets.all(screenWidth * 0.045),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlackText(
            text: serviceName,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            textColor: AppColors.blackColor,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: screenWidth * 0.02),
          Row(
            children: [
              Icon(Icons.person_outline, size: screenWidth * 0.045, color: AppColors.orangeColor),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: BlackText(
                  text: customerName,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: screenWidth * 0.045, color: AppColors.orangeColor),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: BlackText(
                  text: location,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Row(
            children: [
              Icon(Icons.access_time, size: screenWidth * 0.04, color: AppColors.orangeColor),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: BlackText(
                  text: dateTime,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.greyText,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenWidth * 0.02,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.orangeColor.withOpacity(0.3)),
                ),
                child: BlackText(
                  text: "\$ $price",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.orangeColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

