import Flutter
import UIKit
import heresdk

public class SwiftFlutterpluginmemorytestPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let factory = MemoryTestFactory()
    registrar.register(factory, withId: "TestPlatformView")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}

class MemoryTestFactory: NSObject, FlutterPlatformViewFactory {
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        let pView = MemoryTestPlatformView(frame: frame)
        return pView
    }
}

internal class MemoryTestPlatformView: NSObject, FlutterPlatformView {
    var mapView:MapViewLite?
    init(frame:CGRect) {
        let mv = MapViewLite(frame: frame)
        mv.mapScene.loadScene(mapStyle: .normalDay) {
            print("MapScene Load Error : \($0.debugDescription)")
        }
        self.mapView = mv
    }
    
    func view() -> UIView {
        return mapView!
    }
    
    deinit {
        print("PlatformView dealloc.")
    }
}

