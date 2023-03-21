import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dynamic_app_icon_platform_interface.dart';

/// An implementation of [DynamicAppIconPlatform] that uses method channels.
class MethodChannelDynamicAppIcon extends DynamicAppIconPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dynamic_app_icon');

  @override
  Future<void> setIcon(Uint8List imageSource) {
    return methodChannel.invokeMethod<void>('setIcon', imageSource);
  }
}
