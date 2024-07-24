class Account {
  final int number;
  final String name;
  final String cpf;
  double balance;

  Account({
    required this.number,
    required this.cpf,
    required this.balance,
    required this.name,
  });

  void transfer(double amount) {
    if (amount >= 0 && amount <= balance) {
      balance = balance - amount;
    }
  }

}
