
import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class WalletTopupSheet extends StatelessWidget {
  final TextEditingController amountController;
  final String selectedMethod;
  final ValueChanged<String> onChangeMethod;
  final VoidCallback onContinue;

  const WalletTopupSheet({
    super.key,
    required this.amountController,
    required this.selectedMethod,
    required this.onChangeMethod,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final methods = List.generate(7, (i) => {'id': 'paystack_$i', 'label': 'PayStack'});

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWith*.04,
          right: screenWith*.04,
          top: screenHeight*.02,
          bottom: MediaQuery.of(context).viewInsets.bottom + screenHeight*.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlackText(
                text: 'Topup Wallet',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight*.004),
              BlackText(
                text: 'Add Topup Amount',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight*.008),
              TextFieldWidget(
                controller: amountController,
                hintText: ' 50',
                prefixIcon: BlackText(text: '\$', fontSize: 18, fontWeight: FontWeight.w600),
                fillColor: AppColors.whiteColor,
                borderColor: AppColors.orangeColor.withOpacity(.3),
                focusBorderColor: AppColors.orangeColor,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: screenHeight*.014),
              BlackText(
                text: 'Select Payment Option',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                textColor: AppColors.greyText,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight*.008),
              ...methods.map((m) => _PayMethodTile(
                label: m['label'] as String,
                selected: selectedMethod == (m['id'] as String),
                onTap: () => onChangeMethod(m['id'] as String),
              )),
              SizedBox(height: screenHeight*.02),
              OrangeButton(onTap: onContinue, text: 'CONTINUE'),
            ],
          ),
        ),
      ),
    );
  }
}

class _PayMethodTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _PayMethodTile({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: screenHeight*.01),
        padding: EdgeInsets.symmetric(horizontal: screenWith*.03, vertical: screenHeight*.02),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              spreadRadius: 0,
              offset: Offset(0, 2),
            )
          ],
          border: Border.all(color: AppColors.orangeColor.withOpacity(.15)),
        ),
        child: Row(
          children: [
            Image.asset(AppImages.playStack, width: screenWith*.25),
            SizedBox(width: screenWith*.1),
            Expanded(child: BlackText(text: label, fontSize: 12, fontWeight: FontWeight.w500, textAlign: TextAlign.start, textColor: AppColors.greyText)),
            Container(
              width: screenWith*.05,
              height: screenWith*.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected ? AppColors.orangeColor : AppColors.greyColor),
                color: Colors.transparent,
              ),
              child: selected
                  ? Center(child: Container(width: screenWith*.026, height: screenWith*.026, decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.orangeColor)))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showWalletTopupSheet(BuildContext context) async {
  final amountController = TextEditingController(text: '50');
  final screenWith = MediaQuery.of(context).size.width;
  final foodController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenWith*.04),
          topRight: Radius.circular(screenWith*.04),
        ),
      ),
      builder: (ctx){
        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWith*.04),
              topRight: Radius.circular(screenWith*.04),
            ),
          ),
          child: GetBuilder<HomeController>(
            builder: (c){
              return WalletTopupSheet(
                amountController: amountController,
                selectedMethod: c.paymentMethod.value,
                onChangeMethod: (v){ c.paymentMethod.value = v; c.update(); },
                onContinue: (){ Navigator.pop(context); },
              );
            },
          ),
        );
      }
  );
}


