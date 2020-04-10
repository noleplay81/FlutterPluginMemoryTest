#import "FlutterpluginmemorytestPlugin.h"
#if __has_include(<flutterpluginmemorytest/flutterpluginmemorytest-Swift.h>)
#import <flutterpluginmemorytest/flutterpluginmemorytest-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutterpluginmemorytest-Swift.h"
#endif

@implementation FlutterpluginmemorytestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterpluginmemorytestPlugin registerWithRegistrar:registrar];
}
@end
