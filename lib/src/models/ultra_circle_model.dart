import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:huawei_map/huawei_map.dart' as hm;
import 'package:ultra_map_place_picker/src/models/ultra_location_model.dart';

class UltraCircleModel {
  /// Unique identifier for the circle
  final String circleId;

  /// Center location of the circle
  final UltraLocationModel center;

  /// Fill color of the circle
  final Color? fillColor;

  /// Radius of the circle in meters
  final double? radius;

  /// Stroke color of the circle's border
  final Color? strokeColor;

  /// Stroke width of the circle's border in pixels
  final int? strokeWidth;

  /// Visibility of the circle
  final bool? visible;

  /// Z-index of the circle, used for layering
  final int? zIndex;

  /// Callback function to be invoked when the circle is tapped
  final VoidCallback? onTap;
  UltraCircleModel(
      {required this.circleId,
      this.fillColor,
      required this.center,
      this.radius,
      this.strokeColor,
      this.strokeWidth,
      this.visible,
      this.zIndex,
      this.onTap});

  gm.Circle get toGoogleCircle => gm.Circle(
        circleId: gm.CircleId(circleId),
        center: center.googleLatLng,
        strokeWidth: strokeWidth ?? 1,
        visible: visible ?? true,
        consumeTapEvents: onTap != null,
        onTap: onTap,
        zIndex: zIndex ?? 0,
        radius: radius ?? 0,
        strokeColor: strokeColor ?? Colors.black,
        fillColor: fillColor ?? Colors.transparent,
      );

  hm.Circle get toHuaweiCircle => hm.Circle(
        circleId: hm.CircleId(circleId),
        center: center.huaweiLatLng,
        strokeWidth: strokeWidth ?? 1,
        visible: visible ?? true,
        clickable: onTap != null,
        onClick: onTap,
        zIndex: zIndex ?? 0,
        radius: radius ?? 0,
        strokeColor: strokeColor ?? Colors.black,
        fillColor: fillColor ?? Colors.transparent,
      );
}
