class BookingModel {
  final String id;
  final String serviceTitle;
  final String address;
  final String status; // pending, accepted, confirmed, in-progress, completed
  final String timeAgo;
  final String customerName;
  final String serviceIcon; // You can use icon data or asset path
  final String paymentMethod; // cod, card, etc.
  final String paymentStatus; // pending, paid, etc.

  BookingModel({
    required this.id,
    required this.serviceTitle,
    required this.address,
    required this.status,
    required this.timeAgo,
    required this.customerName,
    required this.serviceIcon,
    this.paymentMethod = 'cod',
    this.paymentStatus = 'pending',
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
      paymentMethod: json['paymentMethod'] ?? 'cod',
      paymentStatus: json['paymentStatus'] ?? 'pending',
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
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
    };
  }

  // Copy with method for updating
  BookingModel copyWith({
    String? id,
    String? serviceTitle,
    String? address,
    String? status,
    String? timeAgo,
    String? customerName,
    String? serviceIcon,
    String? paymentMethod,
    String? paymentStatus,
  }) {
    return BookingModel(
      id: id ?? this.id,
      serviceTitle: serviceTitle ?? this.serviceTitle,
      address: address ?? this.address,
      status: status ?? this.status,
      timeAgo: timeAgo ?? this.timeAgo,
      customerName: customerName ?? this.customerName,
      serviceIcon: serviceIcon ?? this.serviceIcon,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }
}

