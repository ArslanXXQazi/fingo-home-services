import 'package:fingohomeservices/scr/components/components/constant/linker.dart';
import 'package:fingohomeservices/scr/components/components/common_widgets/sub_category_card.dart';
import 'package:fingohomeservices/scr/components/components/common_widgets/custom_app_bar.dart';

class SubCategorySelectionView extends StatelessWidget {
  const SubCategorySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.find<HomeController>();

    return Obx(() {
      final selectedService = homeController.selectedService.value;
      final services = homeController.getAllServices();
      final serviceName = selectedService.isNotEmpty 
          ? services[selectedService] ?? 'Select Sub-Category'
          : 'Select Sub-Category';
      
      return Scaffold(
        appBar: CustomAppBar(title: serviceName,fontSize: 22,),
      body: Obx(() {
        final selectedService = homeController.selectedService.value;
        if (selectedService.isEmpty) {
          return Center(
            child: BlackText(
              text: 'Please select a service first',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: AppColors.greyText,
            ),
          );
        }
        
        final subCategories = homeController.getSubCategoriesForService(selectedService);
        final selectedSubCategory = homeController.selectedSubCategory.value;
        
        return Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              BlackText(
                text: "Select Sub-Category",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textColor: AppColors.blackColor,
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: screenWidth * 0.04,
                    mainAxisSpacing: screenHeight * 0.02,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: subCategories.length,
                  itemBuilder: (context, index) {
                    final subCategory = subCategories[index];
                    final isSelected = selectedSubCategory == subCategory;
                    final iconPath = homeController.getSubCategoryIcon(selectedService, subCategory);
                    
                    return SubCategoryCard(
                      subCategoryName: subCategory,
                      iconPath: iconPath,
                      isSelected: isSelected,
                      onTap: () {
                        homeController.setSubCategory(subCategory);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Save Button
              OrangeButton(
                onTap: () {
                  if (selectedSubCategory.isEmpty) {
                    Get.snackbar('Error', 'Please select a sub-category');
                    return;
                  }
                  Get.back();
                },
                text: "Save",
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        );
      }),
      );
    });
  }
}

