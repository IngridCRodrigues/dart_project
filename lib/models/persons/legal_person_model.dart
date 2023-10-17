import 'person_model.dart';

class LegalPersonModel extends PersonModel {
  final String cnpj;

  LegalPersonModel({
    required this.cnpj,
    required super.id,
    required super.name,
    required super.address,
    required super.telephone,
    required super.createdAt,
    required super.accounts,
  });

  bool validaCnpj() {
    if (cnpj.length == 14) {
      return true;
    }
    return false;
  }
}
