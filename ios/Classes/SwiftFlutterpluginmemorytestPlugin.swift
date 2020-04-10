import Flutter
import UIKit

public class SwiftFlutterpluginmemorytestPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
//    let channel = FlutterMethodChannel(name: "flutterpluginmemorytest", binaryMessenger: registrar.messenger())
//    let instance = SwiftFlutterpluginmemorytestPlugin()
//    registrar.addMethodCallDelegate(instance, channel: channel)
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
    var testView:MemTestView?
    init(frame:CGRect) {
        super.init()
        testView = MemTestView(frame: frame)
        testView?.backgroundColor = UIColor(red: CGFloat(arc4random() % 255) / 255.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func view() -> UIView {
        return testView!
    }
    
    deinit {
        print("PlatformView dealloc")
        testView?.removeFromSuperview()
        testView = nil
    }
}

class MemTestView:UIView {
    deinit {
        //doesn't called. (doesn't deallocated.)
        print("MemoryTestView dealloc")
    }
}
