import 'package:flutter/material.dart';

class CustomizedTab extends Tab{

  /// The text to display as the tab's label.
  ///
  /// Must not be used in combination with [child].
  final String text;

  /// The widget to be used as the tab's label.
  ///
  /// Usually a [Text] widget, possibly wrapped in a [Semantics] widget.
  ///
  /// Must not be used in combination with [text].
  final Widget child;

  /// An icon to display as the tab's label.
  final Widget icon;

  const CustomizedTab({
    Key key,
    this.text,
    this.icon,
    this.child,
  }) : assert(text != null || child != null || icon != null),
        assert(!(text != null && null != child)), // TODO(goderbauer): https://github.com/dart-lang/sdk/issues/34180
        super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    double height;
    Widget label;
    if (icon == null) {
      height = 30;
      label = _buildLabelText();
    } else if (text == null && child == null) {
      height = 30;
      label = icon;
    } else {
      height = 50;
      label = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: icon,
            margin: const EdgeInsets.only(bottom: 0.0),
          ),
          _buildLabelText(),
        ],
      );
    }

    return SizedBox(
      height: height,
      child: Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }

  @override
  Widget _buildLabelText() {
    return child ?? Text(text, softWrap: false, overflow: TextOverflow.fade);
  }

}