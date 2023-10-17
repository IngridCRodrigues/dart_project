import '../cards/card_model.dart';

abstract class AccountModel {
  final double balance;
  final String accountNumber;
  final String agencyNumber;
  // TODO(danifbn): Definir o tipo da transação
  final List transactionHistory;
  final CardModel card;
  final AccountType accountType;

  AccountModel({
    required this.balance,
    required this.accountNumber,
    required this.agencyNumber,
    required this.transactionHistory,
    required this.card,
    required this.accountType,
  });

  generateAccountNumber() {}

  viewBalance() {}
}

enum AccountType { current, saving, salary, investment }
