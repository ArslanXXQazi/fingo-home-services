import 'package:fingodriver/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingodriver/scr/components/components/common_widgets/service_card.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';

class MyServicesView extends StatelessWidget {
  const MyServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: CustomAppBar(title: "MY SERVICES"),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Obx(() {
          if (homeController.userServices.isEmpty) {
            return Center(
              child: Padding(
                padding:  EdgeInsets.all(screenWidth*.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.build_outlined,
                      size: screenWidth * 0.2,
                      color: AppColors.greyColor.withOpacity(0.5),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    BlackText(
                      text: 'No services added yet',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.greyText,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    OrangeButton(
                      onTap: () {
                        final AuthController authController = Get.find<AuthController>();
                        authController.userServiceStep.value = 1; // Reset to step 1
                        Get.toNamed(AppRoutes.userServiceDetailsView);
                      },
                      text: 'Add Service',
                      height: screenHeight * 0.06,
                      borderRadius: 15,
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      ...homeController.userServices.asMap().entries.map((entry) {
                        final index = entry.key;
                        final service = entry.value;
                        final serviceKey = service['serviceKey'] as String;
                        final serviceName = service['serviceName'] as String;
                        final subCategory = service['subCategory'] as String;
                        final iconPath = homeController.getServiceIcon(serviceKey);

                        return Obx(() {
                          final isEnabled = homeController.userServices[index]['isEnabled'] as bool? ?? true;
                          return ServiceCard(
                            serviceName: serviceName,
                            subCategory: subCategory,
                            iconPath: iconPath,
                            isEnabled: isEnabled,
                            onToggle: () {
                              homeController.toggleUserServiceStatus(index);
                            },
                          );
                        });
                      }).toList(),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
              ),
              // More Button
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.02,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: OrangeButton(
                  onTap: () {
                    final AuthController authController = Get.find<AuthController>();
                    authController.userServiceStep.value = 1; // Reset to step 1
                    Get.toNamed(AppRoutes.userServiceDetailsView);
                  },
                  text: 'Add More Services',
                  height: screenHeight * 0.06,
                  borderRadius: 15,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

