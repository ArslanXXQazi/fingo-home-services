import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/components/components/common_widgets/service_card.dart';

class ServiceSelectionView extends StatelessWidget {
  const ServiceSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.orangeColor,
        body: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                      AppImages.arrowBack,
                      width: screenWidth * 0.03,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: BlackText(
                      text: "Select Service",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      textColor: AppColors.whiteColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.06),
                ],
              ),
            ),
            // Services Grid
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.06),
                    topRight: Radius.circular(screenWidth * 0.06),
                  ),
                ),
                child: GetBuilder<HomeController>(
                  builder: (controller) {
                    final services = controller.getAllServices();
                    return Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: screenWidth * 0.03,
                          mainAxisSpacing: screenHeight * 0.02,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          final serviceEntry = services.entries.elementAt(index);
                          final serviceKey = serviceEntry.key;
                          final serviceName = serviceEntry.value;
                          final iconPath = controller.getServiceIcon(serviceKey);

                          return ServiceCard(
                            serviceKey: serviceKey,
                            serviceName: serviceName,
                            iconPath: iconPath,
                            onTap: () {
                              controller.setService(serviceKey);
                              Get.back();
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

