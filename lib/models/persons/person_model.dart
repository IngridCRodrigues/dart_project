import '../accounts/account_model.dart';

abstract class PersonModel {
  final int id;
  final String name;
  final String address;
  final String telephone;
  final DateTime createdAt;
  final List<AccountModel> accounts;

  PersonModel({
    required this.id,
    required this.name,
    required this.address,
    required this.telephone,
    required this.createdAt,
    required this.accounts,
  });

  bool validaTelephone() {
    print(telephone);
    return true;
  }
}
