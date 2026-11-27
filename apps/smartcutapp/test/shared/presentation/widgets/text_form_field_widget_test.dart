import 'package:board_cut/shared/presentation/widgets/textformfield/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('validation error does not shrink the text input', (
    tester,
  ) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 300,
              child: Form(
                key: formKey,
                child: TextFormFieldWidget(
                  labelText: 'Name',
                  validator: (_) => 'Name is required',
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final input = find.byType(EditableText);
    final inputHeight = tester.getSize(input).height;

    expect(formKey.currentState!.validate(), isFalse);
    await tester.pumpAndSettle();

    expect(tester.getSize(input).height, inputHeight);
  });
}
