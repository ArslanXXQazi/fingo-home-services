import 'package:fingodriver/scr/components/components/constant/linker.dart';

class BookingNavView extends StatelessWidget {
   BookingNavView({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backGroundGrey,
      appBar: AppBar(
       backgroundColor: Colors.white,
       centerTitle: true,
       title: BlackText(
         text: "Bookings",
         fontSize: 30,
         fontFamily: 'a',
         fontWeight: FontWeight.w400,
         textColor: AppColors.orangeColor,
       ),
     ),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth*.04),
          child: Column(children: [

            SizedBox(height: screenHeight*.02),

            TextFieldWidget(
                controller: searchController,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
            ),





          ],),
        ),
      )),
    );
  }
}
