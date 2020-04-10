import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
class TestPlatformView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestPlatformViewState();
}

class TestPlatformViewState extends State<TestPlatformView> {
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> params = <String,dynamic> {
      'param':1
    };
    switch(defaultTargetPlatform) {
      case TargetPlatform.android:
        break;
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.iOS:
        return UiKitView(viewType: 'TestPlatformView',
          onPlatformViewCreated:onPlatformCreated,
          creationParams: params,
          creationParamsCodec: const StandardMessageCodec(),
        );
    }
    return null;
  }

  void onPlatformCreated(int param) {

  }
}