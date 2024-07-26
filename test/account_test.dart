import 'package:anybank/models/account.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:anybank/main.dart';

void main() {
  group("Testes de transferência", () { 
    test("Testa uma transferência", () {
      final Account account = Account(number: 123, cpf: "322.123.123-22", balance: 100.0, name: "Beto");

      account.transfer(100);
      
      expect(account.balance, 0);
    });

    test("Teste de ua nova transferência", () {
      final Account account = Account(number: 123, cpf: "322.123.123-22", balance: 100.00, name: "Petros");
    account.transfer(50);

    expect(account.balance, 50);

    });

    test("Transferir números negativos", () {
      final Account account = Account(number: 123, cpf: "322.123.123-22", balance: 100.0, name: "Beto");

      account.transfer(-100.0);

      expect(account.balance, 100);
    });

    test("Transferir qualquer coisa que não seja um número", () {
      final Account account = Account(number: 123, cpf: "322.123.123-22", balance: 100.0, name: "Beto");
    });

    test("Transferir 0", () {
      final Account account = Account(number: 123, cpf: "322.123.123-22", balance: 100.0, name: "Beto");
    });

    test("Transferir mais do que disponível no saldo", () {
      final Account account = Account(number: 123, cpf: "322.123.123-22", balance: 100.0, name: "Beto");

      account.transfer(101);

      expect(account.balance, 100);
    });

    group('Dashboard Widget Tests', () {
    testWidgets('Testa se o Dashboard é exibido corretamente', (WidgetTester tester) async {
      // Executa o aplicativo
      await tester.pumpWidget(const AnyBank());

      // Adiciona uma pausa para permitir que a interface seja construída
      await tester.pumpAndSettle();

      // Verifica se o texto "Olá, Petros!" está presente
      expect(find.text('Olá, Petros!'), findsOneWidget);

      // Verifica se o saldo "R\$ 980.67" está presente
      expect(find.text('R\$ 980.67'), findsOneWidget);

      // Verifica se o botão "Transferir" está presente
      expect(find.text('Transferir'), findsOneWidget);
    });

    testWidgets('Testa a presença dos botões de ação', (WidgetTester tester) async {
      await tester.pumpWidget(const AnyBank());
      await tester.pumpAndSettle();

      // Verifica se o botão "Transferir" está presente
      expect(find.text('Transferir'), findsOneWidget);

      // Verifica se o botão "Cobrar" está presente
      expect(find.text('Cobrar'), findsOneWidget);

      // Verifica se o botão "Cartões" está presente
      expect(find.text('Cartões'), findsOneWidget);

      // Verifica se o botão "Recarga" está presente
      expect(find.text('Recarga'), findsOneWidget);
    });

    testWidgets('Testa a presença das últimas transações', (WidgetTester tester) async {
      await tester.pumpWidget(const AnyBank());
      await tester.pumpAndSettle();

      // Verifica se a transação "Compra no iFood" está presente
      expect(find.text('Compra no iFood'), findsOneWidget);

      // Verifica se a transação "Compra na Leroy Merlin" está presente
      expect(find.text('Compra na Leroy Merlin'), findsOneWidget);

      // Verifica se a transação "Transferência recebida" está presente
      expect(find.text('Transferência recebida'), findsOneWidget);
    });

    testWidgets('Testa a presença do próximo pagamento e empréstimos', (WidgetTester tester) async {
      await tester.pumpWidget(const AnyBank());
      await tester.pumpAndSettle();

      // Verifica se o próximo pagamento está presente
      expect(find.text('Próximo pagamento'), findsOneWidget);
      expect(find.text('Quarta-feira, 15 Mai'), findsOneWidget);

      // Verifica se os empréstimos estão presentes
      expect(find.text('Empréstimos'), findsOneWidget);
      expect(find.text('Valor disponível'), findsOneWidget);
      expect(find.text('R\$ 10,000.00'), findsOneWidget);
    });
  });

  });
}
