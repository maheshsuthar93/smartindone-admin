import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulScreen extends StatefulWidget {
  const BaseStatefulScreen({super.key});
}

abstract class BaseState<T extends BaseStatefulScreen> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = ResponsiveHelper.getScreenType(context);

        return buildResponsive(context, screenType);
      },
    );
  }

  Widget buildResponsive(BuildContext context, ScreenType screenType);
}
