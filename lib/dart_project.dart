import 'dart:io';
import 'models/accounts/account_model.dart';
import 'models/cards/card_model.dart';
import 'models/persons/person_model.dart';
import 'models/persons/physical_person_model.dart';

void main() {
  print(
      "Olá! Vamos realizar seu cadastro! Primeiro, vou precisar das suas informações");
  print("Digite F para pessoa física ou J para juridica?");
  String? pessoa = stdin.readLineSync();

  if (pessoa == 'F') {
    print('Digite seu CPF');
    PhysicalPersonModel pessoaFisica;
    String cpf = stdin.readLineSync()!;
    pessoaFisica = recebeDadosPessoa(cpf, 'F');
    print(
        'Qual tipo de conta você deseja criar? Digite C para corrente, I para investimento e S para salário');
    String? tipoDeConta = stdin.readLineSync();
    if (tipoDeConta == 'C') {
      contaCorrente();
    }
    if (tipoDeConta == 'S') {
      contaSalario();
    }
    if (tipoDeConta == 'I') {
      contaInvestimento();
    }
    recebeDadosConta();

    print("*******************************");
    print("Exibindo dados da conta");
    print("CPF: ${pessoaFisica.cpf}");
    print("Nome: ${pessoaFisica.name}");
    print("Endereço: ${pessoaFisica.address}");
    print("Telefone: ${pessoaFisica.telephone}");
  } else if (pessoa == 'J') {
    print('Digite o CNPJ');
    String? cnpj = stdin.readLineSync();
    //recebeDadosPessoa();
    contaCorrente();
  }
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

PhysicalPersonModel recebeDadosPessoa(String cpf, String pessoa) {
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

void contaCorrente() {
  AccountType accountType = AccountType.current;
  print("Deseja um cartão de crédito? S para sim, N para não");
  String? resposta = stdin.readLineSync();
  if (resposta == 'S') {
    preencheCartaoCredito();
  }
}

void contaSalario() {}
void contaInvestimento() {}

void preencheCartaoDebito() {}
void preencheCartaoCredito() {}
