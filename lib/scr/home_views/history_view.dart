import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/components/components/common_widgets/service_history_card.dart';
import 'package:fingodriver/scr/components/components/common_widgets/custom_app_bar.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  final List<Map<String, dynamic>> historyData = [
    {
      'serviceName': 'Home Deep Cleaning',
      'customerName': 'Michael Peters',
      'location': 'Lekki Phase 1, Lagos',
      'price': '25,000',
      'dateTime': 'Nov 10, 2025 • 2:30 PM',
      'status': 'Completed',
    },
    {
      'serviceName': 'AC Repair & Maintenance',
      'customerName': 'Esther Johnson',
      'location': 'Victoria Island, Lagos',
      'price': '18,500',
      'dateTime': 'Nov 09, 2025 • 11:15 AM',
      'status': 'Completed',
    },
    {
      'serviceName': 'Plumbing - Pipe Fix',
      'customerName': 'Kunle Adeoye',
      'location': 'Ikeja GRA, Lagos',
      'price': '9,800',
      'dateTime': 'Nov 08, 2025 • 4:45 PM',
      'status': 'Cancelled',
    },
    {
      'serviceName': 'Electrical Wiring Check',
      'customerName': 'Ngozi Chukwu',
      'location': 'Yaba Tech Quarters, Lagos',
      'price': '14,200',
      'dateTime': 'Nov 07, 2025 • 10:00 AM',
      'status': 'Pending',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backGroundGrey,
      appBar: const CustomAppBar(title: "HISTORY"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: ListView.builder(
            itemCount: historyData.length,
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
            itemBuilder: (context, index) {
              final item = historyData[index];
              return ServiceHistoryCard(
                serviceName: item['serviceName'],
                customerName: item['customerName'],
                location: item['location'],
                price: item['price'],
                dateTime: item['dateTime'],
              );
            },
          ),
        ),
      ),
    );
  }
}

