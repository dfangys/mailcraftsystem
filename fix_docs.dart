import 'dart:io';

void main() {
  // List of files that need documentation fixes
  final files = [
    'lib/app/bootstrap.dart',
    'lib/core/env/env_config.dart',
    'lib/core/error/failures.dart',
    'lib/core/logging/logger.dart',
    'lib/core/network/dio_client.dart',
    'lib/core/utils/extensions.dart',
    'lib/shared/widgets/loading_widget.dart',
  ];

  for (final filePath in files) {
    final file = File(filePath);
    if (file.existsSync()) {
      print('Processing $filePath...');
      addDocumentationToFile(file);
    }
  }
}

void addDocumentationToFile(File file) {
  final lines = file.readAsLinesSync();
  final newLines = <String>[];

  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];

    // Check if this line needs documentation
    if (needsDocumentation(line, i > 0 ? lines[i - 1] : '')) {
      // Add documentation comment
      final indent = getIndentation(line);
      final docComment = generateDocComment(line, indent);
      newLines.add(docComment);
    }

    newLines.add(line);
  }

  file.writeAsStringSync(newLines.join('\n'));
}

bool needsDocumentation(String line, String previousLine) {
  // Skip if already has documentation
  if (previousLine.trim().startsWith('///')) return false;

  // Check for public members that need documentation
  final trimmed = line.trim();

  return trimmed.startsWith('class ') ||
      trimmed.startsWith('enum ') ||
      trimmed.startsWith('abstract class ') ||
      trimmed.startsWith('mixin ') ||
      trimmed.startsWith('extension ') ||
      (trimmed.startsWith('static ') && !trimmed.contains('_')) ||
      (trimmed.contains('get ') && !trimmed.contains('_')) ||
      (trimmed.contains('set ') && !trimmed.contains('_')) ||
      (trimmed.contains('(') &&
          !trimmed.contains('_') &&
          !trimmed.startsWith('_'));
}

String getIndentation(String line) {
  final match = RegExp(r'^(\s*)').firstMatch(line);
  return match?.group(1) ?? '';
}

String generateDocComment(String line, String indent) {
  final trimmed = line.trim();

  if (trimmed.startsWith('class ')) {
    final className = extractName(trimmed, 'class ');
    return '$indent/// $className class';
  } else if (trimmed.startsWith('enum ')) {
    final enumName = extractName(trimmed, 'enum ');
    return '$indent/// $enumName enumeration';
  } else if (trimmed.startsWith('abstract class ')) {
    final className = extractName(trimmed, 'abstract class ');
    return '$indent/// Abstract $className class';
  } else if (trimmed.startsWith('mixin ')) {
    final mixinName = extractName(trimmed, 'mixin ');
    return '$indent/// $mixinName mixin';
  } else if (trimmed.startsWith('extension ')) {
    final extensionName = extractName(trimmed, 'extension ');
    return '$indent/// $extensionName extension';
  } else if (trimmed.contains('get ')) {
    return '$indent/// Gets the value';
  } else if (trimmed.contains('set ')) {
    return '$indent/// Sets the value';
  } else {
    return '$indent/// Public member';
  }
}

String extractName(String line, String prefix) {
  final withoutPrefix = line.substring(prefix.length).trim();
  final spaceIndex = withoutPrefix.indexOf(' ');
  final braceIndex = withoutPrefix.indexOf('{');
  final extendsIndex = withoutPrefix.indexOf(' extends');
  final implementsIndex = withoutPrefix.indexOf(' implements');
  final withIndex = withoutPrefix.indexOf(' with');

  final indices = [
    spaceIndex,
    braceIndex,
    extendsIndex,
    implementsIndex,
    withIndex
  ].where((i) => i > 0).toList();

  if (indices.isEmpty) return withoutPrefix;

  final endIndex = indices.reduce((a, b) => a < b ? a : b);
  return withoutPrefix.substring(0, endIndex);
}
