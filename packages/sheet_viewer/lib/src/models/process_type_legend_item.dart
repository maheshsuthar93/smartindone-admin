import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
final class ProcessTypeLegendItem {
  const ProcessTypeLegendItem({
    required this.name,
    required this.sequenceOrder,
    required this.color,
  });

  final String name;
  final int sequenceOrder;
  final Color color;
}
