import 'package:fingohomeservices/scr/booking_model/booking_model.dart';
import 'package:fingohomeservices/scr/components/components/common_widgets/custom_app_bar.dart';
import 'package:fingohomeservices/scr/components/components/constant/linker.dart';
import 'package:fingohomeservices/scr/controllers/map_controller.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get booking from arguments if provided
    final booking = Get.arguments as BookingModel?;
    
    return _MapViewState(booking: booking);
  }
}

class _MapViewState extends StatefulWidget {
  final BookingModel? booking;

  const _MapViewState({
    this.booking,
  });

  @override
  State<_MapViewState> createState() => _MapViewStateState();
}

class _MapViewStateState extends State<_MapViewState> {
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = Get.put(MapController());
  }

  // Callback when map is created
  void _onMapCreated(GoogleMapController controller) {
    mapController.onMapCreated(controller);
    
    // If booking is provided, add destination marker after map is ready
    if (widget.booking != null) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        mapController.addDestinationMarker(widget.booking!.address);
      });
    }
  }

  @override
  void dispose() {
    mapController.clearMarkers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(title: "Tracking"),
      body: Obx(() {
        if (mapController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.orangeColor,
            ),
          );
        }

        return Stack(
          children: [
            // Google Map
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  mapController.currentPosition.value.latitude,
                  mapController.currentPosition.value.longitude,
                ),
                zoom: 15,
              ),
              markers: mapController.markers.values.toSet(),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
            ),
            
          ],
        );
      }),
    );
  }
}
