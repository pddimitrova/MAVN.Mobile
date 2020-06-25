import 'package:flutter/material.dart';

class CustomSliverAppBarDelegate<T extends PreferredSizeWidget>
    extends SliverPersistentHeaderDelegate {
  CustomSliverAppBarDelegate(this.child);

  final T child;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      Container(child: child);

  @override
  bool shouldRebuild(CustomSliverAppBarDelegate oldDelegate) => false;
}
