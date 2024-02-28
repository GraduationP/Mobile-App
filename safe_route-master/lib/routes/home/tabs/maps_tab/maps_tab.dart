import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapsTab extends StatefulWidget {


  @override
  State<MapsTab> createState() => _MapsTabState();
}

class _MapsTabState extends State<MapsTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(51.509364, -0.128928),
          zoom: 9.2,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://api.mapbox.com/styles/v1/zahret-elislam/clsci9kks01ou01r40nli1f1z/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiemFocmV0LWVsaXNsYW0iLCJhIjoiY2xzY2FwdG82MGhxMjJrb2FyYjlheXprMyJ9.--32X_CmZJDTkyFt90HazA',
            additionalOptions: {
              'accessToken':'pk.eyJ1IjoiemFocmV0LWVsaXNsYW0iLCJhIjoiY2xzY2FwdG82MGhxMjJrb2FyYjlheXprMyJ9.--32X_CmZJDTkyFt90HazA',
              'id':'mapbox.mapbox-streets-v8'

    },
          ),
          // MarkerLayer(
          //   markers: [
          //     Marker(point: LatLng(51.509364, -0.128928),width: 80.0,height: 80.0, builder: (context) => Container(
          //       child: FlutterLogo(
          //
          //       ),
          //     ),)
          //   ],
          // )
        ],
      )

    );
  }
  subscribeToLocationUpdates(){
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //todo:show another dialog to the user explaining why do u need this permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }



}
