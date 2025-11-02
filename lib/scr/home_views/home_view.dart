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
              fontWeight: FontWeight.w600,
              textColor: AppColors.greyText,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: screenHeight*.02),

            Container(
              padding: EdgeInsets.all(screenWidth*.03),
              width: screenWidth*.4,
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
                Row(children: [
                  BlackText(
                    text: "0.0/5",
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: screenWidth*.035,
                    backgroundColor: AppColors.backGroundGrey,
                    child: Icon(Icons.star,size: screenWidth*.05,),
                  )

                ],),
                SizedBox(height: screenHeight*.01),
                BlackText(
                  text: "Average Ratting",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  textColor: AppColors.orangeColor,
                )

              ],),
            )



          ],),
        ),
      )),
    );
  }
}
