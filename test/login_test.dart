
import 'package:flutter_test/flutter_test.dart';

import 'package:prova_flutter/main.dart';

void main() {
  testWidgets('Login View Tests', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Usuário'), findsOneWidget);
    expect(find.text('Usuario'), findsNothing);



    expect(find.text('senha'), findsNothing);
    expect(find.text('Senha'), findsOneWidget);

    
  });
}
