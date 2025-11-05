import 'package:fingohomeservices/scr/booking_model/booking_model.dart';
import 'package:fingohomeservices/scr/components/components/constant/linker.dart';

class BookingController extends GetxController {
  // Selected filter
  final RxString selectedFilter = 'pending'.obs;

  // List of all bookings
  final RxList<BookingModel> allBookings = <BookingModel>[].obs;

  // Loading state for accept action
  final RxMap<String, bool> acceptingBookings = <String, bool>{}.obs;

  // Loading state for arrival at destination
  final RxMap<String, bool> arrivingAtDestination = <String, bool>{}.obs;

  // Bookings that have arrived (waiting for completion)
  final RxSet<String> arrivedBookings = <String>{}.obs;

  // Get filtered bookings based on selected filter
  List<BookingModel> get filteredBookings {
    if (selectedFilter.value == 'all') {
      return allBookings;
    }
    return allBookings
        .where((booking) => booking.status.toLowerCase() == selectedFilter.value)
        .toList();
  }

  // Get count for each filter
  int getFilterCount(String filter) {
    if (filter == 'all') {
      return allBookings.length;
    }
    return allBookings
        .where((booking) => booking.status.toLowerCase() == filter)
        .length;
  }

  // Change filter
  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }

  // Accept booking with loading
  Future<void> acceptBooking(String bookingId) async {
    // Set loading state
    acceptingBookings[bookingId] = true;

    // Wait for 2 seconds
    await Future.delayed(Duration(seconds: 2));

    final index = allBookings.indexWhere((b) => b.id == bookingId);
    if (index != -1) {
      final booking = allBookings[index];
      allBookings[index] = booking.copyWith(
        status: 'accepted',
        paymentMethod: 'cod',
        paymentStatus: 'pending',
      );
      Get.snackbar('Success', 'Booking accepted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.greenColor,
          colorText: Colors.white);
    }

    // Remove loading state
    acceptingBookings.remove(bookingId);
  }

  // Check if booking is being accepted
  bool isAccepting(String bookingId) {
    return acceptingBookings[bookingId] ?? false;
  }

  // Reject booking
  void rejectBooking(String bookingId) {
    allBookings.removeWhere((b) => b.id == bookingId);
    Get.snackbar('Success', 'Booking rejected successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.redColor,
        colorText: Colors.white);
  }

  // Arrival at Destination with loading
  Future<void> arrivalAtDestination(String bookingId) async {
    // Set loading state
    arrivingAtDestination[bookingId] = true;

    // Wait for 2 seconds
    await Future.delayed(Duration(seconds: 2));

    // Mark as arrived
    arrivedBookings.add(bookingId);

    // Remove loading state
    arrivingAtDestination.remove(bookingId);

    Get.snackbar('Success', 'Arrived at destination',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.greenColor,
        colorText: Colors.white);
  }

  // Check if booking is arriving at destination
  bool isArrivingAtDestination(String bookingId) {
    return arrivingAtDestination[bookingId] ?? false;
  }

  // Check if booking has arrived (waiting for completion)
  bool hasArrived(String bookingId) {
    return arrivedBookings.contains(bookingId);
  }

  // Mark booking as completed
  void markAsCompleted(String bookingId) {
    final index = allBookings.indexWhere((b) => b.id == bookingId);
    if (index != -1) {
      final booking = allBookings[index];
      allBookings[index] = booking.copyWith(
        status: 'completed',
      );
      arrivedBookings.remove(bookingId);
      Get.snackbar('Success', 'Booking completed successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.greenColor,
          colorText: Colors.white);
    }
  }

  // Load dummy data
  void loadDummyData() {
    // Dummy JSON data converted to BookingModel
    final dummyData = [
      {
        'id': '1',
        'serviceTitle': 'Washing Machine Installation',
        'address': 'Qureshi, Dera Ismail Khan, Khyber Pakhtunkhwa, 123456',
        'status': 'pending',
        'timeAgo': '7h ago',
        'customerName': 'John Doe',
        'serviceIcon': 'washing_machine',
      },
      {
        'id': '2',
        'serviceTitle': 'AC Repair',
        'address': 'Main Street, Lahore, Punjab, 54000',
        'status': 'pending',
        'timeAgo': '5h ago',
        'customerName': 'Jane Smith',
        'serviceIcon': 'ac_repair',
      },
      {
        'id': '3',
        'serviceTitle': 'Plumbing Service',
        'address': 'Gulshan, Karachi, Sindh, 75300',
        'status': 'accepted',
        'timeAgo': '2h ago',
        'customerName': 'Ali Ahmed',
        'serviceIcon': 'plumbing',
      },
      {
        'id': '4',
        'serviceTitle': 'Electrical Work',
        'address': 'F-7, Islamabad, 44000',
        'status': 'accepted',
        'timeAgo': '1h ago',
        'customerName': 'Sarah Khan',
        'serviceIcon': 'electrical',
      },
      {
        'id': '5',
        'serviceTitle': 'Refrigerator Fix',
        'address': 'Model Town, Multan, Punjab, 60000',
        'status': 'confirmed',
        'timeAgo': '30m ago',
        'customerName': 'Ahmed Raza',
        'serviceIcon': 'refrigerator',
      },
      {
        'id': '6',
        'serviceTitle': 'TV Installation',
        'address': 'Cantt, Rawalpindi, Punjab, 46000',
        'status': 'in-progress',
        'timeAgo': '15m ago',
        'customerName': 'Fatima Ali',
        'serviceIcon': 'tv',
      },
    ];

    allBookings.value = dummyData
        .map((json) => BookingModel.fromJson(json))
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }
}
