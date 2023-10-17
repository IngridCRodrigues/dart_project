import 'dart:io';
import 'dart:math';
import 'models/accounts/account_model.dart';
import 'models/accounts/current_account_model.dart';
import 'models/cards/card_model.dart';
import 'models/cards/credit_card_model.dart';
import 'models/cards/debit_card_model.dart';
import 'models/persons/legal_person_model.dart';
import 'models/persons/person_model.dart';
import 'models/persons/physical_person_model.dart';

void main() {
  print(
      "Olá! Vamos realizar seu cadastro! Primeiro, vou precisar das suas informações");
  print("Digite F para pessoa física ou J para juridica?");
  String? pessoa = stdin.readLineSync();

  if (pessoa == 'F') {
    PhysicalPersonModel pessoaFisica;
    pessoaFisica = recebeDadosPessoa();
    //recebeDadosConta();
    DebitCardModel cartao = criaCartao(pessoaFisica);
    CurrentAccountModel conta = corrente(cartao);
    CreditCardModel cartaoCredito;

    print(
        'Qual tipo de conta você deseja criar? Digite C para corrente, I para investimento e S para salário');
    String? tipoDeConta = stdin.readLineSync();
    if (tipoDeConta == 'C') {
      contaCorrente();
      print("Deseja um cartão de crédito? S para sim, N para não");
      String resposta = stdin.readLineSync()!;
      if (resposta == 'S') {
        preencheCartaoCredito();
      }
    }
    if (tipoDeConta == 'S') {
      contaSalario();
    }
    if (tipoDeConta == 'I') {
      contaInvestimento();
    }

    print("*******************************");
    print("Exibindo dados da conta");
    print("CPF: ${pessoaFisica.cpf}");
    print("Nome: ${pessoaFisica.name}");
    print("Endereço: ${pessoaFisica.address}");
    print("Telefone: ${pessoaFisica.telephone}");
    print("Numero do cartao: ${cartao.cardNumber}");
    print("CVV do cartao: ${cartao.cvv}");
    print("Saldo da contao: ${conta.balance}");
  } else if (pessoa == 'J') {
    LegalPersonModel pessoaJuridica = recebeDadosPessoaJuridica();
    DebitCardModel cartaoJuridico = criaCartao(pessoaJuridica);
    recebeDadosConta();
    contaCorrente();
    print("*******************************");
    print("Exibindo dados da conta");
    print("CPF: ${pessoaJuridica.cnpj}");
    print("Nome: ${pessoaJuridica.name}");
    print("Endereço: ${pessoaJuridica.address}");
    print("Numero do cartao: ${cartaoJuridico.cardNumber}");
    print("CVV cartão: ${cartaoJuridico.cvv}");
  }
}

CurrentAccountModel corrente(cartao) {
  print("Qual valor do deposito inicial?");
  double balance = double.parse(stdin.readLineSync()!);
  String accountNumber = '12345';
  String agencyNumber = '4567';
  List transactionHistory = [];
  CardModel cardModel = cartao;
  //Account Type

  CurrentAccountModel conta = CurrentAccountModel(
      balance: balance,
      accountNumber: accountNumber,
      agencyNumber: agencyNumber,
      transactionHistory: transactionHistory,
      card: cardModel);
  return conta;
}

void recebeDadosConta() {
  print("Qual valor do deposito inicial?");
  double balance = double.parse(stdin.readLineSync()!);
  String accountNumber = '12345';
  String agencyNumber = '4567';
  List transactionHistory = [];
  //CardModel cardModel = ;
  //Account Type
}

DebitCardModel criaCartao(PersonModel pessoa) {
  PersonModel pessoaCartao = pessoa;
  String cardNumber = '1111111111';
  String cvv;
  CardFlag flag = CardFlag.masterCard;
  DateTime expirationDate = DateTime(2025, 9, 7, 17, 30);
  int min = 100, max = 999;
  Random rnd = Random();
  int random = min + rnd.nextInt(max - min);
  cvv = random.toString();

  DebitCardModel cartao = DebitCardModel(
      person: pessoa,
      cardNumber: cardNumber,
      cvv: cvv,
      flag: flag,
      expirationDate: expirationDate);

  return cartao;
}

PhysicalPersonModel recebeDadosPessoa() {
  print('Digite seu CPF');
  String cpf = stdin.readLineSync()!;
  print('Digite nome');
  String nome = stdin.readLineSync()!;
  print('Digite Endereço');
  String address = stdin.readLineSync()!;
  print('Digite Telefone');
  String telephone = stdin.readLineSync()!;
  int id = 1;
  List<AccountModel> tipo = [];
  DateTime aniversario = DateTime.now();

  PhysicalPersonModel pessoa = PhysicalPersonModel(
      cpf: cpf,
      birthAt: aniversario,
      id: id,
      name: nome,
      address: address,
      telephone: telephone,
      createdAt: aniversario,
      accounts: tipo);
  return pessoa;
}

LegalPersonModel recebeDadosPessoaJuridica() {
  print('Digite o CNPJ');
  String cnpj = stdin.readLineSync()!;
  print('Digite nome');
  String nome = stdin.readLineSync()!;
  print('Digite Endereço');
  String address = stdin.readLineSync()!;
  print('Digite Telefone');
  String telephone = stdin.readLineSync()!;
  int id = 1;
  List<AccountModel> tipo = [];
  DateTime aniversario = DateTime.now();

  LegalPersonModel pessoa = LegalPersonModel(
      cnpj: cnpj,
      id: id,
      name: nome,
      address: address,
      telephone: telephone,
      createdAt: aniversario,
      accounts: tipo);
  return pessoa;
}

void contaCorrente() {
  AccountType accountType = AccountType.current;
}

void contaSalario() {
  AccountType accountType = AccountType.salary;
}

void contaInvestimento() {
  AccountType accountType = AccountType.investment;
}

void preencheCartaoDebito() {}
void preencheCartaoCredito() {
  /*
  final double limit;
  final double spentValue;
  final int expiringDay;
  final int turnDay;
  final InvoiceModel invoice;
  double get availableLimit => limit - spentValue;*/
}
