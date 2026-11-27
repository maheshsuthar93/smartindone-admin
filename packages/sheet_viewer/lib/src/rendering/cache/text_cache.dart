import 'package:flutter/material.dart';

final class TextCache {
  final Map<int, TextPainter> _cache = {};

  TextPainter painter({
    required String text,
    required TextStyle style,
    TextAlign textAlign = TextAlign.center,
    TextDirection textDirection = TextDirection.ltr,
    int? maxLines,
  }) {
    final key = Object.hash(
      text,
      style,
      textAlign,
      textDirection,
      maxLines,
    );

    return _cache.putIfAbsent(
      key,
          () {
        final painter = TextPainter(
          text: TextSpan(
            text: text,
            style: style,
          ),
          textAlign: textAlign,
          textDirection: textDirection,
          maxLines: maxLines,
        );

        painter.layout();

        return painter;
      },
    );
  }

  void clear() {
    _cache.clear();
  }
}