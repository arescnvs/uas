import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yuks/main.dart';

// This file does not exist yet,
// it will be generated in the next step
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // The [directories] variable does not exist yet,
      // it will be generated in the next step
      directories: directories,
    );
  }
}

@widgetbook.UseCase(name: 'Brainly App', type: BrainlyApp)
Widget buildBrainlyAppUseCase(BuildContext context) {
  return BrainlyApp();
}