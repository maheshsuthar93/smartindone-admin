import 'package:board_cut/core/enums/enums.dart';
import 'package:board_cut/features/machines/data/models/machine_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('decodes machine fields, type and factory summary from API JSON', () {
    final machine = MachineModel.fromJson({
      'id': 'machine-1',
      'name': 'Panel saw 1',
      'code': 'MCH-0001',
      'type': 'PANEL_SAW',
      'factoryId': 'factory-1',
      'factory': {
        'id': 'factory-1',
        'name': 'Main factory',
        'code': 'FAC-0001',
      },
      'isActive': true,
      'kerf': 3.2,
    });

    expect(machine.type, MachineType.panelSaw);
    expect(machine.factoryName, 'Main factory');
    expect(machine.kerf, 3.2);
    expect(machine.toJson()['type'], 'PANEL_SAW');
    expect(machine.toJson()['factory'], {
      'id': 'factory-1',
      'name': 'Main factory',
      'code': 'FAC-0001',
    });
  });
}
