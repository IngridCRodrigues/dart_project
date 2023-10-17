import 'dart:io';

import 'person_model.dart';

class PhysicalPersonModel extends PersonModel {
  final String cpf;
  final DateTime birthAt;

  PhysicalPersonModel({
    required this.cpf,
    required this.birthAt,
    required super.id,
    required super.name,
    required super.address,
    required super.telephone,
    required super.createdAt,
    required super.accounts,
  });

  bool validaCpf() {
    return true;
  }

  bool validaIdade() {
    if (birthAt.year > 2005) {
      return true;
    }
    return false;
  }
}
