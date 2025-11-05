import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/controllers/booking_controller.dart';
import 'package:fingodriver/scr/components/components/common_widgets/booking_filter_buttons.dart';
import 'package:fingodriver/scr/components/components/common_widgets/booking_card.dart';

class BookingNavView extends StatelessWidget {
  BookingNavView({super.key});
  final TextEditingController searchController = TextEditingController();
  final BookingController controller = Get.put(BookingController());

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),

              // Search Field
              TextFieldWidget(
                controller: searchController,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
              ),

              // Filter Buttons
              Obx(() => BookingFilterButtons(
                    selectedFilter: controller.selectedFilter.value,
                    controller: controller,
                    onFilterChanged: (filter) {
                      controller.changeFilter(filter);
                    },
                  )),

              // Booking Cards List
              Expanded(
                child: Obx(() {
                  if (controller.filteredBookings.isEmpty) {
                    return Center(
                      child: BlackText(
                        text: 'No bookings found',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.greyText,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.filteredBookings.length,
                    itemBuilder: (context, index) {
                      final booking = controller.filteredBookings[index];
                      return BookingCard(
                        booking: booking,
                        controller: controller,
                        onAccept: () {
                          controller.acceptBooking(booking.id);
                        },
                        onReject: () {
                          controller.rejectBooking(booking.id);
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
