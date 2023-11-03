import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    double mapSize = size.height * 0.78;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 64.0),
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.84,
              decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12)),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Enter Area',
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.08,
          ),
          AnimatedContainer(
            height: mapSize,
            duration: Duration(milliseconds: 100),
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34), topRight: Radius.circular(34)),
              child: Align(
                child: GoogleMap(
                  // mapType: MapType.hybrid,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(45.521563, -122.677433),
                    zoom: 11,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
