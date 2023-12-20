import 'dart:typed_data';

class Contact {
  String id;
  String displayName;
  Uint8List? photo;
  Uint8List? thumbnail;
  Name name;
  List<Phone> phones;
  List<Email> emails;
  List<Address> addresses;

  Contact({
    required this.id,
    required this.displayName,
    this.photo,
    this.thumbnail,
    required this.name,
    required this.phones,
    required this.emails,
    required this.addresses,
  });
}

class Name {
  String first;
  String last;

  Name({required this.first, required this.last});

  @override
  String toString() {
    return '$first $last';
  }
}

enum PhoneLabel { mobile, work, home, other }

class Phone {
  String number;
  PhoneLabel label;

  Phone({required this.number, required this.label});
}

enum EmailLabel { work, home, other }

class Email {
  String address;
  EmailLabel label;

  Email({required this.address, required this.label});
}

enum AddressLabel { work, home, other }

class Address {
  String address;
  AddressLabel label;

  Address({required this.address, required this.label});
}
