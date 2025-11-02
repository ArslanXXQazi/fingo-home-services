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
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*.02),
          child: Column(children: [

            SizedBox(height: screenHeight*.02),
            




          ],),
        ),
      )),
    );
  }
}
