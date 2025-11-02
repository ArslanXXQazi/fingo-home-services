import 'package:fingodriver/scr/components/components/common_widgets/app_drawer.dart';
import 'package:fingodriver/scr/components/components/common_widgets/go_to_pickup_bottom_sheet.dart';
import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:fingodriver/scr/home_views/map_controller/map_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  @override
  void initState() {
    super.initState();
    // Show bottom sheet after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        _showRideRequestBottomSheet();
      }
    });
    
    // Listen to state changes
    final homeController = Get.find<HomeController>();
    ever(homeController.currentState, (String state) {
      if (state == 'ride_in_progress' && mounted) {
        Future.delayed(Duration(milliseconds: 500), () {
          _showRideInProgressBottomSheet();
        });
      }
    });
  }
  
  void _showRideRequestBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RideRequestBottomSheet(
            onRideAccepted: () {
              print("Ride accepted callback called");
              // Update state to go to pickup
              Get.find<HomeController>().setGoToPickupState();
              // Show the go to pickup bottom sheet after a delay
              Future.delayed(Duration(milliseconds: 500), () {
                _showGoToPickupBottomSheet();
              });
            },
      ),
    );
  }
  
  void _showGoToPickupBottomSheet() {
    print("Attempting to show go to pickup bottom sheet");
    if (mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => GoToPickupBottomSheet(
          onPickupReached: () {
            print("Pickup reached callback called");
            // Update state to ride started
            Get.find<HomeController>().setRideStartedState();
            // Show the ride start bottom sheet after a delay
            Future.delayed(Duration(milliseconds: 500), () {
              _showRideStartBottomSheet();
            });
          },
        ),
      );
    }
  }

  void _showRideStartBottomSheet() {
    print("Attempting to show ride start bottom sheet");
    if (mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => RideStartBottomSheet(),
      );
    }
  }

  void _showRideInProgressBottomSheet() {
    print("Attempting to show ride in progress bottom sheet");
    if (mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => RideInProgressBottomSheet(
          onRideEnded: () {
            print("Ride ended callback called");
            // Reset to home state
            Get.find<HomeController>().resetToHomeState();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Initialize Controllers
    final MapController mapController = Get.put(MapController());
    final HomeController homeController = Get.put(HomeController());
    
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (ctx) => GestureDetector(
                onTap: () {
                  Scaffold.of(ctx).openDrawer();
                },
                child: CircleAvatar(
                  radius: screenWith*.05,
                  backgroundColor: AppColors.orangeColor,
                  child: SvgPicture.asset(AppImages.more,width: screenWith*.05,),
                ),
              ),
            ),
            Spacer(),
            Obx(() => BlackText(
              text: homeController.getAppBarTitle(),
              fontWeight: FontWeight.w400,
              fontSize: 30,
              fontFamily: 'a',
              textColor: AppColors.orangeColor,
            )),
            Spacer(),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight*.05),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              height: screenHeight,
              width: screenWith,
              child: Obx(() {
                if (mapController.isLoading.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.orangeColor,
                        ),
                        SizedBox(height: 16),
                        BlackText(
                          text: "Getting your location...",
                          fontSize: 16,
                          textColor: AppColors.orangeColor,
                        ),
                      ],
                    ),
                  );
                }
                
                return GoogleMap(
                  onMapCreated: mapController.onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      mapController.currentPosition.value.latitude,
                      mapController.currentPosition.value.longitude,
                    ),
                    zoom: 14.0,
                  ),
                  markers: mapController.markers.values.toSet(),
                  myLocationEnabled: false, // Hide default blue marker
                  myLocationButtonEnabled: false, // Hide default location button
                  zoomControlsEnabled: false, // Hide zoom controls (+ and - buttons)
                  mapType: MapType.normal,
                  onTap: (LatLng position) {
                    // Handle map tap if needed
                  },
                );
              }),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              mapController.refreshLocation();
            },
            backgroundColor: AppColors.orangeColor,
            child: Icon(
              Icons.my_location,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
}
