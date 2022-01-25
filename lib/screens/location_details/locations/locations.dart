import 'package:flutt_project/models/location.dart';
import 'package:flutt_project/screens/location_details/image_jaban.dart';
import 'package:flutt_project/style.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("locations"),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, locations[index]),
      ),
    );
  }

  /* List<Widget> itemsList(List<Location> location) {
    return location
        .map((location) => GestureDetector(
            onTap: () => _onLocationTap(context, location.id),
            child: Container(child: Text(location.name))))
        .toList();
  }*/

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, location.id),
      child: Container(
        height: 200.0,
        child: Banner(
          location: BannerLocation.bottomEnd,
          message: location.tourPackageName,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              ImageSection(location.imagePath),
              Text(location.name, style: TextInLOcationsList),
            ],
          ),
        ),
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }
}
