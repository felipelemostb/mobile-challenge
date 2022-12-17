import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet }

class DeviceScreenInformation {
  static num perimeter(BuildContext context) {
    num deviceHeightScreen = MediaQuery.of(context).size.height;
    num deviceWidthScreen = MediaQuery.of(context).size.width;
    num perimeter = ((deviceHeightScreen * 2) + (deviceWidthScreen * 2));
    return perimeter;
  }

  static DeviceType getDeviceType(BuildContext context) {
    DeviceType deviceType;
    // ignore: no_leading_underscores_for_local_identifiers
    num _perimeter = perimeter(context);
    if (_perimeter >= 2655) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.mobile;
    }
    return deviceType;
  }

  static num minAndMaxSize(num min, num max) {
    return max - min;
  }
}
