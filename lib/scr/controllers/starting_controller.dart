

import '../components/components/constant/linker.dart';

class StartingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<String> onboardingImages = <String>[
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
  ];

  // Dummy texts for each onboarding page. You can change later.
  final List<String> onboardingTitles = <String>[
    'Drive your way to financial\nfreedom.',
    'Your wheels, your income, your future',
    'Every ride matters, every mile\ncounts',
  ];


  void onPageChanged(int index) {
    currentPage.value = index;
  }

  bool get isLastPage => currentPage.value == onboardingImages.length - 1;

  void next() {
    if (isLastPage) {
      finishOnboarding();
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goTo(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void finishOnboarding() {
    Get.offAllNamed(AppRoutes.loginView);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}