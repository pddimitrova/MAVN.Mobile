import 'package:flutter/material.dart';

class PreferredSizeWrapper extends StatelessWidget
    implements PreferredSizeWidget {
  const PreferredSizeWrapper({
    @required this.child,
    @required this.preferredHeight,
  });

  final Widget child;
  final double preferredHeight;

  @override
  Widget build(BuildContext context) => child;

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
