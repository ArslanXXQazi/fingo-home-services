
import 'package:fingodriver/scr/components/components/common_widgets/app_drawer.dart';
import 'package:fingodriver/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';

class TopUpHistory extends StatelessWidget {
  const TopUpHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: CustomAppBar(title: "TopUp History"),
      body: Center(child: BlackText(
        text: "No Transaction History",
      ),),
    );
  }
}
