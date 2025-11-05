import 'package:fingohomeservices/scr/components/components/constant/linker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapController extends GetxController {
  // Observable variables
  var currentPosition = Position(
    latitude: 24.8607, // Default to Karachi, Pakistan
    longitude: 67.0011,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    altitudeAccuracy: 0.0,
    heading: 0.0,
    headingAccuracy: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  ).obs;

  var currentAddress = ''.obs;
  var isLoading = false.obs;
  GoogleMapController? mapController;
  var markers = <MarkerId, Marker>{}.obs;

  // Default location (Karachi, Pakistan)
  final LatLng defaultLocation = const LatLng(24.8607, 67.0011);

  @override
  void onInit() {
    super.onInit();
    // Add default marker for initial location
    addCurrentLocationMarker();
    getCurrentLocation();
  }

  // Get current location
  Future<void> getCurrentLocation() async {
    try {
      isLoading.value = true;
      
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar(
          'Location Services',
          'Location services are disabled. Please enable them.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            'Permission Denied',
            'Location permissions are denied.',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar(
          'Permission Denied',
          'Location permissions are permanently denied.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Get current position with timeout
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      );

      print('Location found: ${position.latitude}, ${position.longitude}');
      currentPosition.value = position;
      
      // Get address from coordinates
      await getAddressFromLatLng(position.latitude, position.longitude);
      
      // Add red marker for current location
      addCurrentLocationMarker();
      
      // Move camera to current location
      moveToCurrentLocation();
      
    } catch (e) {
      print('Location error: $e');
      Get.snackbar(
        'Error',
        'Error getting location: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Get address from coordinates
  Future<void> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentAddress.value = '${place.street}, ${place.locality}, ${place.administrativeArea}';
      }
    } catch (e) {
      currentAddress.value = 'Address not available';
    }
  }

  // Add red marker for current location
  void addCurrentLocationMarker() {
    const markerId = MarkerId('current_location');
    final marker = Marker(
      markerId: markerId,
      position: LatLng(currentPosition.value.latitude, currentPosition.value.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(
        title: 'Current Location',
        snippet: currentAddress.value.isNotEmpty ? currentAddress.value : 'Location detected',
      ),
    );
    
    markers[markerId] = marker;
    markers.refresh();
    print('Marker added at: ${currentPosition.value.latitude}, ${currentPosition.value.longitude}');
  }

  // Update map camera to current location
  void moveToCurrentLocation() {
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(currentPosition.value.latitude, currentPosition.value.longitude),
        ),
      );
    }
  }

  // On map created callback
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // Move to current location when map is created
    Future.delayed(const Duration(milliseconds: 500), () {
      moveToCurrentLocation();
    });
  }

  // Refresh location
  Future<void> refreshLocation() async {
    await getCurrentLocation();
  }

  // Add destination marker from address
  Future<void> addDestinationMarker(String address) async {
    try {
      // Convert address to coordinates
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations[0];
        final destinationLatLng = LatLng(location.latitude, location.longitude);
        
        const markerId = MarkerId('destination');
        final marker = Marker(
          markerId: markerId,
          position: destinationLatLng,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: address,
          ),
        );
        
        markers[markerId] = marker;
        markers.refresh();
        
        // Move camera to show both markers
        _moveCameraToShowBothMarkers(destinationLatLng);
      }
    } catch (e) {
      print('Error adding destination marker: $e');
      Get.snackbar(
        'Error',
        'Could not find location for address: $address',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Move camera to show both current location and destination
  void _moveCameraToShowBothMarkers(LatLng destinationLatLng) {
    if (mapController != null) {
      final currentLatLng = LatLng(
        currentPosition.value.latitude,
        currentPosition.value.longitude,
      );
      
      // Calculate bounds to include both markers
      double minLat = currentLatLng.latitude < destinationLatLng.latitude
          ? currentLatLng.latitude
          : destinationLatLng.latitude;
      double maxLat = currentLatLng.latitude > destinationLatLng.latitude
          ? currentLatLng.latitude
          : destinationLatLng.latitude;
      double minLng = currentLatLng.longitude < destinationLatLng.longitude
          ? currentLatLng.longitude
          : destinationLatLng.longitude;
      double maxLng = currentLatLng.longitude > destinationLatLng.longitude
          ? currentLatLng.longitude
          : destinationLatLng.longitude;
      
      final bounds = LatLngBounds(
        southwest: LatLng(minLat, minLng),
        northeast: LatLng(maxLat, maxLng),
      );
      
      mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 100),
      );
    }
  }

  // Clear all markers
  void clearMarkers() {
    markers.clear();
    markers.refresh();
  }
}
