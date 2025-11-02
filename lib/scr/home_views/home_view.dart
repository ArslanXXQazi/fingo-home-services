import 'package:fingodriver/scr/components/components/constant/linker.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
    backgroundColor: AppColors.backGroundGrey,
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: BlackText(
         text: "Performance Dashbo...",
         fontSize: 22,
         textColor: AppColors.orangeColor,
       ),
     ),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            SizedBox(height: screenHeight*.02),

            // Service Status Card
            ServiceStatusCard(),
            SizedBox(height: screenHeight*.02),
            BlackText(
              text: "Your Performance",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              textColor: AppColors.orangeColor,
            ),
            SizedBox(height: screenHeight*.006),
            BlackText(
              text: "Stats reflecting your work on Fingo home services",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textColor: AppColors.greyText,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: screenHeight*.02),
            // Performance Cards Grid
            GetBuilder<HomeController>(
              builder: (c) {
                return Column(
                  children: [
                    // First Row - 2 Cards
                    Row(
                      children: [
                        Expanded(
                          child: PerformanceCard(
                            value: c.averageRating.value,
                            label: "Average Rating",
                            icon: Icons.star,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: PerformanceCard(
                            value: c.jobsCompleted.value,
                            label: "Jobs Completed",
                            icon: Icons.check_circle,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Second Row - 2 Cards
                    Row(
                      children: [
                        Expanded(
                          child: PerformanceCard(
                            value: c.onTimeArrival.value,
                            label: "On-Time Arrival",
                            icon: Icons.access_time,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: PerformanceCard(
                            value: c.repeatCustomers.value,
                            label: "Repeat Customers",
                            icon: Icons.refresh,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
              SizedBox(height: screenHeight*.02),
              Row(
                children: [
                  Icon(Icons.feedback,color: AppColors.orangeColor,size: screenWidth*.06,),
                  SizedBox(width: screenWidth*.02),
                  BlackText(
                    text: "Customer Feedback",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.orangeColor,
                  ),
                ],
              ),
              SizedBox(height: screenHeight*.01),
              Container(
                height: screenHeight*.003,
                width: screenWidth*.25,
                color: AppColors.orangeColor,
              )


          ],),
        ),
      )),
    );
  }
}
