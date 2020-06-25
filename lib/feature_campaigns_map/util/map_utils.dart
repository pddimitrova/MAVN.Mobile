import 'dart:math' as dart_math;

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong/latlong.dart' as lat_long;

class MapUtils {
  ///Returns Google map zoom level from [radius] in KM, [mapWidth] in pixels
  ///and [latitude] of location
  static double getZoomForRadius({
    final double radius,
    final double mapWidth,
    final double latitude,
  }) {
    const equatorLength = 40075004; // in meters
    const magic = 0.6;
    final latitudinalAdjustment =
        dart_math.cos(dart_math.pi * latitude / 180.0);

    final arg =
        equatorLength * mapWidth * latitudinalAdjustment / (radius * 256.0);

    final zoom = dart_math.log(arg) / dart_math.log(2.0);
    return zoom * magic;
  }

  ///Returns the area that the map would need to show
  ///in order to fit all [markers] and optionally [userLocation]
  static LatLngBounds getBoundsFromMarkerList({
    @required List<Marker> markers,
    LatLng userLocation,
  }) {
    if (markers == null || markers.isEmpty) return null;
    final allLocations = List.of(markers);
    if (userLocation != null) {
      allLocations
          .add(Marker(markerId: MarkerId('me'), position: userLocation));
    }
    double x0, x1, y0, y1;
    for (final marker in allLocations) {
      if (x0 == null) {
        x0 = x1 = marker.position.latitude;
        y0 = y1 = marker.position.longitude;
      } else {
        if (marker.position.latitude > x1) x1 = marker.position.latitude;
        if (marker.position.latitude < x0) x0 = marker.position.latitude;
        if (marker.position.longitude > y1) y1 = marker.position.longitude;
        if (marker.position.longitude < y0) y0 = marker.position.longitude;
      }
    }
    return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
  }

  ///Returns the distance between 2 [LatLng] points
  static double getDistance(LatLng pos1, LatLng pos2) {
    const distance = lat_long.Distance();

    final km = distance.as(
      lat_long.LengthUnit.Kilometer,
      lat_long.LatLng(pos1.latitude, pos1.longitude),
      lat_long.LatLng(pos2.latitude, pos2.longitude),
    );
    return km;
  }
}

extension GetRadius on LatLngBounds {
  double getRadius() {
    final ne = northeast;
    final sw = southwest;

    const distance = lat_long.Distance();
    final double dist = distance(lat_long.LatLng(ne.latitude, ne.longitude),
        lat_long.LatLng(sw.latitude, sw.longitude));

    const metersPerKm = 1000.0;
    return (dist / metersPerKm) / 2.0;
  }
}
