import 'package:flutt_project/models/location.dart';
import 'package:flutt_project/screens/location_details/image_jaban.dart';
import 'package:flutt_project/screens/location_details/text_section.dart';
import 'package:flutter/material.dart';

class LocationDetails extends StatelessWidget {
  final int _locationID;

  LocationDetails(this._locationID);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchById(_locationID);
    return Scaffold(
      appBar: AppBar(
        title: Text(location!.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageSection(location.imagePath),
            ...textSections(location),
          ],
        ),
      ),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
