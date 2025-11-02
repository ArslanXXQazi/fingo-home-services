import 'package:fingodriver/scr/components/components/common_widgets/app_drawer.dart';
import 'package:fingodriver/scr/components/components/common_widgets/custom-appbar_2nd.dart';
import 'package:fingodriver/scr/components/components/common_widgets/wallet_topup_sheet.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: CustomAppBar2nd(title: "EARNING"),
      body: SafeArea(
        child: Column(
          children: [
            // Main content area
            Expanded(
              child: SingleChildScrollView(
        child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWith * 0.02),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      // Orange balance card
            Container(
              width: screenWith,
                        height: screenHeight * 0.25,
              decoration: BoxDecoration(
                  color: AppColors.orangeColor,
                          borderRadius: BorderRadius.circular(screenWith * 0.05),
              ),
                        child: Stack(
                          children: [
                            // Background illustration
                Align(
                    alignment: Alignment.topRight,
                              child: Image.asset('assets/w.png'),
                            ),
                            // Balance text
                Padding(
                              padding: EdgeInsets.all(screenWith * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlackText(
                        text: "Total Balance",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.whiteColor,
                      ),
                      BlackText(
                        text: "\$ 0.00",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.whiteColor,
                      ),
                                ],
                              ),
                ),
                            // Topup Wallet button
                Positioned(
                              right: screenWith * 0.02,
                              bottom: screenHeight * 0.09,
                  child: OrangeButton(
                                onTap: () {
                                  showWalletTopupSheet(context);
                                },
                    text: "TOPUP WALLET",
                    color: Colors.white,
                    textColor: AppColors.orangeColor,
                                height: screenHeight * 0.05,
                                width: screenWith * 0.35,
                    borderRadius: 30,
                    fontSize: 12,
                  ),
                ),
                            // Topup History button
                Positioned(
                              right: screenWith * 0.02,
                              bottom: screenHeight * 0.02,
                  child: OrangeButton(
                                onTap: () {
                      Get.toNamed(AppRoutes.topUpHistory);
                    },
                    text: "TOPUP HISTORY",
                    color: Colors.white,
                    textColor: AppColors.orangeColor,
                                height: screenHeight * 0.05,
                                width: screenWith * 0.35,
                    borderRadius: 30,
                    fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      // Tab bar
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicatorColor: AppColors.orangeColor,
                          indicatorWeight: 2,
                          labelColor: AppColors.orangeColor,
                          unselectedLabelColor: Colors.grey.shade600,
                          dividerHeight: 0,
                          labelStyle: GoogleFonts.geologica(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: GoogleFonts.geologica(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          tabs: const [
                            Tab(text: "Daily"),
                            Tab(text: "Monthly"),
                            Tab(text: "Yearly"),
                          ],
                        ),
                      ),
                      // Tab content area
                      SizedBox(
                        height: screenHeight * 0.3,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Daily content
                            Center(
                              child: BlackText(
                                text: "Daily",
                                fontSize: 16,
                                textColor: Colors.grey.shade600,
                              ),
                            ),
                            // Monthly content
                            Center(
                              child: BlackText(
                                text: "Monthly",
                                fontSize: 16,
                                textColor: Colors.grey.shade600,
                              ),
                            ),
                            // Yearly content
                            Center(
                              child: BlackText(
                                text: "Yearly",
                                fontSize: 16,
                                textColor: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom action buttons
            Container(
              padding: EdgeInsets.all(screenWith * 0.04),
              child: Row(
                children: [
                  // Withdraw button
                  Expanded(
                    flex: 40,
                    child: OrangeButton(
                      onTap: () {
                        Get.toNamed(AppRoutes.withdrawMethod);
                      },
                      text: "WITHDRAW",
                      color: AppColors.orangeColor,
                      textColor: AppColors.whiteColor,
                      height: screenHeight * 0.06,
                      borderRadius: 10,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: screenWith * 0.05),
                  // Withdraw History button
                  Expanded(
                    flex: 60,
                    child: OrangeButton(
                      onTap: () {
                      },
                      text: "WITHDRAW HISTORY",
                      color: Colors.white,
                      textColor: AppColors.orangeColor,
                      borderColor: AppColors.orangeColor,
                      height: screenHeight * 0.06,
                      borderRadius: 10,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
