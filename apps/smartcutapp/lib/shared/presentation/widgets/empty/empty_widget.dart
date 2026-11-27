import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Text(
        text,

        //style: AppTextStyle.mediumBlackRegular
      ),
    );
  }
}
