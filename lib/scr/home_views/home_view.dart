import 'package:fingodriver/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
      
    );
  }
}
