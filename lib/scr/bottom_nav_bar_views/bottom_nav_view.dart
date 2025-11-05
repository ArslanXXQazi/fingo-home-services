import 'package:fingohomeservices/scr/components/components/constant/linker.dart';
import 'package:fingohomeservices/scr/home_views/booking_nav_view.dart';
import 'package:fingohomeservices/scr/home_views/home_view.dart';
import 'package:fingohomeservices/scr/home_views/my_profile_view.dart';
import 'package:fingohomeservices/scr/home_views/wallet_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});
  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomeView(),
            BookingNavView(),
            WalletView(),
            MyProfileView(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
          },
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.orangeColor,
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
