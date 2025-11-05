import 'package:fingohomeservices/scr/components/components/common_widgets/app_drawer.dart';
import 'package:fingohomeservices/scr/components/components/common_widgets/custom-appbar_2nd.dart';
import 'package:fingohomeservices/scr/components/components/common_widgets/bank_transfer_card.dart';
import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class WithdrawMethod extends StatelessWidget {
  const WithdrawMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: CustomAppBar2nd(title: "WITHDRAW METHOD"),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            itemCount: 5, // Number of bank transfer cards as shown in image
            itemBuilder: (context, index) {
              return BankTransferCard(
                title: "Bank Transfer",
                status: "Setup is Pending.",
                actionText: "Setup Now",
                iconPath: AppImages.bank,
                onActionTap: () {
                  // Navigate to AddBankView
                  Get.toNamed(AppRoutes.addBankView);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
