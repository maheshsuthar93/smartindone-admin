import 'package:flutter/material.dart';

/// Reusable section used throughout the Sheet Viewer workspace.
///
/// Examples:
/// - Toolbar
/// - Viewer
/// - Status Bar
class ViewerSection extends StatelessWidget {
  const ViewerSection({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.elevation = 1,
    this.borderRadius = 6,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: elevation,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
