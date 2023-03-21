import Cocoa

import FlutterMacOS

public class DynamicAppIconPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dynamic_app_icon", binaryMessenger: registrar.messenger)
    let instance = DynamicAppIconPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "setIcon":
      let imageData = call.arguments as! FlutterStandardTypedData
      NSApplication.shared.applicationIconImage = NSImage(data: imageData.data)
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
