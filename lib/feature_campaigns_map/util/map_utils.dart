import 'dart:math' as Math;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong/latlong.dart' as lat_long;

class MapUtils {
  static double getZoomForRadius({
    final double radius,
    final double mapWidth,
    final double latitude,
  }) {
    const equatorLength = 40075004; // in meters

    final latitudinalAdjustment = Math.cos(Math.pi * latitude / 180.0);

    final arg =
        equatorLength * mapWidth * latitudinalAdjustment / (radius * 256.0);

    final x = Math.log(arg) / Math.log(2.0);
    print('ZOOM $x');
    return x;
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
