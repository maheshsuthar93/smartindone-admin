import 'package:flutter/material.dart';

class ViewerCard extends StatelessWidget {
  const ViewerCard({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.elevation = 1,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: elevation,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: child,
    );
  }
}
