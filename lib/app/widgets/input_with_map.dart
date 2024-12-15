import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/rent/controllers/rent_controller.dart';
import 'package:rentalin_id/app/modules/rent/views/rent3_view.dart';
import 'package:rentalin_id/app/widgets/button_main.components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyMapScreen extends StatelessWidget {
  final MapController _mapController = Get.put(MapController());
  final RxString _address = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Titik Koordinat'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              child: FutureBuilder<Position>(
                future: _getUserLocation(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: Text("Lokasi tidak ditemukan"));
                  }

                  Position position = snapshot.data!;
                  LatLng initialPosition =
                      LatLng(position.latitude, position.longitude);

                  return Obx(() {
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: initialPosition,
                        zoom: 12,
                      ),
                      onMapCreated: (GoogleMapController controller) {},
                      onTap: (LatLng location) async {
                        _mapController.updateLocation(location);
                        await _updateAddress(location);
                      },
                      markers: {
                        if (_mapController.selectedLocation.value != null)
                          Marker(
                            markerId: const MarkerId('selected_location'),
                            position: _mapController.selectedLocation.value!,
                            infoWindow:
                                const InfoWindow(title: 'Titik Terpilih'),
                          ),
                      },
                    );
                  });
                },
              ),
            ),
            _buildLocationInfoBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfoBox() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(13, 21, 14, 21),
      width: 344,
      // height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Koordinat Titik',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: tdBlue,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: tdSecBlue),
            ),
            padding: const EdgeInsets.all(10),
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  _mapController.selectedLocation.value == null
                      ? 'Belum memilih lokasi'
                      : 'Lat: ${_mapController.selectedLocation.value!.latitude}, Lng: ${_mapController.selectedLocation.value!.longitude}',
                  style: const TextStyle(fontSize: 14, color: tdBlue),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Alamat',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: tdBlue,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: tdSecBlue),
            ),
            padding: const EdgeInsets.all(10),
            child: Obx(() {
              return Text(
                _address.value.isEmpty
                    ? 'Alamat belum ditemukan'
                    : _address.value,
                style: const TextStyle(fontSize: 14, color: tdBlue),
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: ButtonMainComponents(
                buttonName: "Open Google maps", nextPage: () {
                  _launchURL("https://www.google.com/maps?q=${_mapController.selectedLocation.value!.latitude},${_mapController.selectedLocation.value!.longitude}");
                }),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: ButtonMainComponents(
                buttonName: "Next",
                nextPage: () {
                  Get.to(Rent3View(), arguments:{'address': _address.value});
                }),
          )
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<Position> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Layanan lokasi tidak diaktifkan');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Izin lokasi ditolak');
      }
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _updateAddress(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      if (placemarks.isNotEmpty) {
        final Placemark placemark = placemarks.first;
        _address.value =
            '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
      } else {
        _address.value = 'Alamat tidak ditemukan';
      }
    } catch (e) {
      _address.value = 'Gagal mendapatkan alamat';
    }
  }
}

class InputWithMap extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function(LatLng) onLocationSelected;
  final Function(String)? onChanged;
  const InputWithMap({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.onLocationSelected,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: tdBlue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: controller,
          cursorColor: tdSecBlue,
          onChanged: onChanged,
          style: const TextStyle(color: tdBlue, fontSize: 16),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: tdSecBlue),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fillColor: tdWhite,
            hoverColor: tdSecBlue,
            filled: true,
            alignLabelWithHint: false,
            hintText: hintText,
            hintStyle: const TextStyle(color: tdSecBlue),
            suffixIcon: IconButton(
              icon: const Icon(Icons.location_on),
              color: tdBlue,
              onPressed: () async {
                final selectedLocation = await Navigator.push<LatLng>(
                  context,
                  MaterialPageRoute(builder: (context) => MyMapScreen()),
                );
                if (selectedLocation != null) {
                  onLocationSelected(selectedLocation);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
