import 'package:anybank/models/account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testes de transferência 1", () {
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
  });
}
