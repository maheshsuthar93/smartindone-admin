import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessScreen extends StatelessWidget {
  const BaseStatelessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = ResponsiveHelper.getScreenType(context);

          return buildResponsive(context, screenType);
        },
      ),
    );
  }

  Widget buildResponsive(BuildContext context, ScreenType screenType);
}
