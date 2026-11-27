import '../../sheet_viewer.dart';

class SheetChangedEvent {
  const SheetChangedEvent({required this.sheet, required this.index});

  final Sheet sheet;
  final int index;
}
