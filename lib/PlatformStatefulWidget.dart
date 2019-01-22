import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class PlatformStatefulWidget<I extends Widget, A extends Widget> extends StatefulWidget {

  @override
  State createState() {
    if (Platform.isIOS) {
      return createIosWidget();
    }
    return createAndroidWidget();
  }

  State createIosWidget();

  State createAndroidWidget();
}
