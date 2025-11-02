class BookingModel {
  final String id;
  final String serviceTitle;
  final String address;
  final String status; // pending, accepted, confirmed, in-progress, completed
  final String timeAgo;
  final String customerName;
  final String serviceIcon; // You can use icon data or asset path

  BookingModel({
    required this.id,
    required this.serviceTitle,
    required this.address,
    required this.status,
    required this.timeAgo,
    required this.customerName,
    required this.serviceIcon,
  });

  // Factory constructor for creating from JSON
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? '',
      serviceTitle: json['serviceTitle'] ?? '',
      address: json['address'] ?? '',
      status: json['status'] ?? 'pending',
      timeAgo: json['timeAgo'] ?? '',
      customerName: json['customerName'] ?? '',
      serviceIcon: json['serviceIcon'] ?? '',
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serviceTitle': serviceTitle,
      'address': address,
      'status': status,
      'timeAgo': timeAgo,
      'customerName': customerName,
      'serviceIcon': serviceIcon,
    };
  }
}

