import 'package:anybank/models/account.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:anybank/main.dart';

void main() {
  group("Testes de testes de transferência", () {
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


  });
}
