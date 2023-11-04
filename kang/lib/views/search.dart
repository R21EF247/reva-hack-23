import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:kang/constants/const.dart';

GoogleMapsPlaces _places =
    GoogleMapsPlaces(apiKey: ConstantValues.GmapApiKey());

@RoutePage()
class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  double mapSize = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 0.98,
          child: Stack(
            children: [
              Positioned(
                top: size.height * 0.08,
                left: size.width * 0.07,
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.84,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.06,
                        width: size.width * 0.70,
                        child: TextFormField(
                          controller: controller,
                          onTap: () => onEdit(context),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: 'Enter Area',
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              mapSize = mapSize == 0.5 ? 1 : 0.5;
                            });
                          },
                          icon: Icon(Icons.tune))
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  curve: Curves.ease,
                  width: size.width,
                  height: size.height * 0.78 * mapSize,
                  duration: Duration(milliseconds: 100),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34)),
                    child: Align(
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(45.521563, -122.677433),
                          zoom: 11,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onEdit(BuildContext context) async {
    var kGoogleApiKey = ConstantValues.GmapApiKey();
    try {
      Prediction? p = await PlacesAutocomplete.show(
        offset: 0,
        radius: 1000,
        types: [],
        strictbounds: false,
        context: context,
        apiKey: kGoogleApiKey,
        mode: Mode.overlay, // Mode.fullscreen
        language: "en",
        components: [Component(Component.country, "us")],
      );

      // Handle the response, e.g., update the UI or move to the next screen
    } catch (e) {
      // Handle the error, e.g., show a toast or a dialog
      log("Error occurred: $e");
    }
  }
}
