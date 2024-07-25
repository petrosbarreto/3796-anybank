import 'package:anybank/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Testes de Integração', () {
    testWidgets('Testa o fluxo de login', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verifica se o Dashboard é exibido
      expect(find.text('Olá, Petros!'), findsOneWidget);
      expect(find.text('R\$ 980.67'), findsOneWidget);

      // Verifica a presença dos botões de ação
      expect(find.text('Transferir'), findsOneWidget);
      expect(find.text('Cobrar'), findsOneWidget);
      expect(find.text('Cartões'), findsOneWidget);
      expect(find.text('Recarga'), findsOneWidget);

      // Verifica as últimas transações
      expect(find.text('Compra no iFood'), findsOneWidget);
      expect(find.text('Compra na Leroy Merlin'), findsOneWidget);
      expect(find.text('Transferência recebida'), findsOneWidget);

      // Verifica a presença do próximo pagamento e empréstimos
      expect(find.text('Próximo pagamento'), findsOneWidget);
      expect(find.text('Quarta-feira, 15 Mai'), findsOneWidget);
      expect(find.text('Empréstimos'), findsOneWidget);
      expect(find.text('Valor disponível'), findsOneWidget);
      expect(find.text('R\$ 10,000.00'), findsOneWidget);

      // Realiza uma ação no botão "Transferir"
      await tester.tap(find.text('Transferir'));
      await tester.pumpAndSettle();

      // Verifica se a tela de Transferência foi aberta (adapte conforme necessário)
      // expect(find.text('Tela de Transferência'), findsOneWidget);
    });
  });
}
