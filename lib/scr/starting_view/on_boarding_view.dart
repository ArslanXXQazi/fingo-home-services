

import 'package:fingohomeservices/scr/components/components/constant/linker.dart';



class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final StartingController controller = Get.put(StartingController());
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: screenWith,
          height: screenHeight,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.onboardingImages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              return Image.asset(
                controller.onboardingImages[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),

        SafeArea(
            child: Padding(
              padding: EdgeInsets.all(screenWith*.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SmoothPageIndicator(
                        controller: controller.pageController,
                        count:  controller.onboardingImages.length,
                        effect:  ExpandingDotsEffect(
                          activeDotColor: AppColors.orangeColor,
                          dotColor: AppColors.whiteColor,
                          dotHeight: screenWith * .02,
                          dotWidth: screenWith * .02,
                        ),
                        onDotClicked: (index){
                          controller.goTo(index);
                        }
                    ),
                  ),
                  SizedBox(height: screenHeight*.03),
                  Obx(() => BlackText(
                    text: controller.onboardingTitles[controller.currentPage.value],
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.white,
                    textAlign: TextAlign.start,
                  )),
                  SizedBox(height: screenHeight*.03),
                  OrangeButton(
                    onTap: controller.next,
                    text: "Get Started",
                  )

                ],),
            ))


      ],),
    );
  }
}
