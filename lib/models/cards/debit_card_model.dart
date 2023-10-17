import 'dart:ffi';

import 'card_model.dart';

class DebitCardModel extends CardModel {
  DebitCardModel({
    required super.person,
    required super.cardNumber,
    required super.cvv,
    required super.flag,
    required super.expirationDate,
  });

  debitMoney(Float saldoAtual) {
    checkCard(); //verifica se tá tudo certo com o cartão
  }
}
