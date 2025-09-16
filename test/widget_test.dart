// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mailcraftsystem/app/bootstrap.dart';

void main() {
  setUpAll(() async {
    // Load environment variables for tests to prevent dotenv NotInitializedError
    try {
      await dotenv.load();
    } catch (_) {
      await dotenv.load(fileName: '.env.example');
    }
  });

  testWidgets('MailCraft app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MailCraftApp(),
      ),
    );

    // Verify that the splash screen renders
    expect(find.text('MailCraft'), findsOneWidget);
    expect(find.text('Initializing secure connection...'), findsOneWidget);
  });
}
