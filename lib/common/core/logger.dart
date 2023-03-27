import 'dart:developer';
import 'package:flutter/foundation.dart' as foundation;
import 'package:logger/logger.dart';

final logger = Logger(
  printer: foundation.kDebugMode
      ? PrettyPrinter(
          lineLength: 100,
          errorMethodCount: 0,
          methodCount: 0,
          colors: false,
        )
      : null,
  output: ConsoleOutput(),
);

class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(log);
  }
}
