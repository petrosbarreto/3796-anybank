import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:anybank/main.dart'; 
import 'package:anybank/screens/dashboard.dart'; 
import 'package:anybank/models/counter.dart';
import 'package:test/test.dart';

void main() {
  testWidgets('Testa se o Dashboard é exibido corretamente', (WidgetTester tester) async {
    // Executa o aplicativo
    await tester.pumpWidget(const AnyBank());

    // Adiciona uma pausa para permitir que a interface seja construída
    await tester.pumpAndSettle();

    //expect(find.text('Olá, Petros!'), findsOneWidget);

    // // Verifica se o texto "Olá, Petros!" está presente
    // expect(find.text('Olá, Petros!'), findsOneWidget);
    //
    // // Verifica se o saldo "R\$ 980.67" está presente
    // expect(find.text('R\$ 980.67'), findsOneWidget);
    //
    // // Verifica se o botão "Transferir" está presente
    // expect(find.text('Transferir'), findsOneWidget);
  });
}