import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class TextButtonInvisibleBorder extends StatelessWidget {
  final String text;
  final VoidCallback actionOnClick;
  final TextStyle? _style;
  final Widget? child;
  final ShapeBorder? customBorder;

  TextButtonInvisibleBorder(this.text, this.actionOnClick, this._style,
      {this.child, this.customBorder});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: ScaleTap(
          onPressed: () {},
          child: InkWell(
            customBorder: customBorder != null
                ? customBorder
                : Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
            hoverColor: Color.fromRGBO(60, 63, 65, 1.0),
            focusColor: Colors.transparent,
            highlightColor: Color.fromRGBO(168, 75, 67, .2),
            splashColor: Colors.transparent,
            onTap: actionOnClick,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: child == null ? Text(text, style: _style) : child),
          ),
        ));
  }
}
