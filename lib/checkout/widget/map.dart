import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:l_and_u/checkout/checkout_repository/location_repository.dart';

import 'dart:ui' as ui;

import '../../component/const.dart';
import '../../product_ditails/widget/bottom_button.dart';
import '../checkout_repository/checkout_repository.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController googleMapController;
  Set<Marker> marker = {};
  Future<Uint8List> getBytesFromAssets(String path, int wid) async {
    ByteData data = await rootBundle.load(
      path,
    );
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: wid);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
      format: ui.ImageByteFormat.png,
    ))!
        .buffer
        .asUint8List();
  }

  LocationRepository locationRepository = LocationRepository();
  CheckoutRepository checkoutRepository = CheckoutRepository();

  @override
  void initState() {
    locationRepository.getUserLocation().then((value) {
      loadMarker(value?.latitude ?? 32.01506498251323,
          value?.longitude ?? 35.86841225609592);
      Future.delayed(const Duration(seconds: 3), () {
        Provider.of<CheckoutRepository>(context, listen: false)
            .convertLatlngToAddress(LatLng(value?.latitude ?? 32.01506498251323,
                value?.longitude ?? 35.86841225609592));
      });
    });

    super.initState();
  }

  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(32.01506498251323, 35.86841225609592),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: (argument) {
              loadMarker(argument.latitude, argument.longitude);
              Provider.of<CheckoutRepository>(context, listen: false)
                  .convertLatlngToAddress(argument);
            },
            zoomControlsEnabled: false,
            markers: marker,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) async {
              String style = await DefaultAssetBundle.of(context)
                  .loadString('assets/map.json');
              controller.setMapStyle(style);
              _controller.complete(controller);
              googleMapController = controller;
            },
          ),
          Positioned(
            bottom: size.height * 0.06,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                Provider.of<CheckoutRepository>(context, listen: false)
                    .goToMapMethod(false);
                Provider.of<CheckoutRepository>(context, listen: false)
                    .addAddress(
                        Provider.of<CheckoutRepository>(context, listen: false)
                            .myAddress);
              },
              child: const BottomButton(
                color: fontColor,
                topPadding: 100,
                child: Text(
                  'Save Location',
                  style: TextStyle(color: Color(mainColor), fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loadMarker(double latitude, double longitude) async {
    final Uint8List merkerIcon =
        await getBytesFromAssets('assets/images/location-pin.png', 115);

    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 14)));
    // marker.clear();
    marker.add(Marker(
        onDragEnd: (value) async {
          Provider.of<CheckoutRepository>(context, listen: false)
              .convertLatlngToAddress(value);
        },
        draggable: true,
        icon: BitmapDescriptor.fromBytes(merkerIcon),
        markerId: const MarkerId('currentLocation'),
        position: LatLng(latitude, longitude)));

    setState(() {});
  }
}
