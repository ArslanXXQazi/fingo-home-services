import 'package:fingohomeservices/scr/components/components/common_widgets/app_drawer.dart';
import 'package:fingohomeservices/scr/components/components/common_widgets/custom-appbar_2nd.dart';
import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class DriverInbox extends StatelessWidget {
  const DriverInbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: CustomAppBar2nd(title: "INBOX"),
      body: Center(child: BlackText(
        text: "No Conversation found",
      ),),
    );
  }
}
