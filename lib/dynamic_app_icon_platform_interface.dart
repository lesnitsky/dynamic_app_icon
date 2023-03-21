import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dynamic_app_icon_method_channel.dart';

abstract class DynamicAppIconPlatform extends PlatformInterface {
  /// Constructs a DynamicAppIconPlatform.
  DynamicAppIconPlatform() : super(token: _token);

  static final Object _token = Object();

  static DynamicAppIconPlatform _instance = MethodChannelDynamicAppIcon();

  /// The default instance of [DynamicAppIconPlatform] to use.
  ///
  /// Defaults to [MethodChannelDynamicAppIcon].
  static DynamicAppIconPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DynamicAppIconPlatform] when
  /// they register themselves.
  static set instance(DynamicAppIconPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setIcon(Uint8List imageSource) {
    throw UnimplementedError('setIcon() has not been implemented.');
  }
}
