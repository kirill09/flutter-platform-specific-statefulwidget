import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_statefulwidget/PlatformStatefulWidget.dart';

class PlatformSwitch extends PlatformStatefulWidget<CupertinoSwitch, Switch> {
  final Widget title;
  bool value;
  final ValueChanged<bool> onChanged;

  PlatformSwitch({
    this.title,
    this.value,
    this.onChanged
  });

  @override
  State<StatefulWidget> createAndroidWidget() {
    return _PlatformSwitchAndroidState();
  }

  @override
  State<StatefulWidget> createIosWidget() {
    return _PlatformSwitchIosState();
  }
}

class _PlatformSwitchIosState extends State<PlatformSwitch>{
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        title: widget.title,
        trailing: CupertinoSwitch(
          value: widget.value,
          onChanged: widget.onChanged,
        ),
        onTap: () { setState(() { widget.value = !widget.value; }); },
      ),
    );
  }
}

class _PlatformSwitchAndroidState extends State<PlatformSwitch>{
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        title: widget.title,
        trailing: Switch(
          value: widget.value,
          onChanged: widget.onChanged,
        ),
        onTap: () { setState(() { widget.value = !widget.value; }); },
      ),
    );
  }
}
