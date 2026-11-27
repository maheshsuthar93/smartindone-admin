import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String toDdMMMyyyy() {
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');

    return formatter.format(this);
  }

  String toDateTime() {
    final DateFormat formatter = DateFormat('dd-MMM-yyyy At HH:mm a');

    return formatter.format(this);
  }
}
